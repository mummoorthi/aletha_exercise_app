import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/exercise.dart';
import '../bloc/exercise_bloc.dart';

class ExerciseDetailPage extends StatefulWidget {
  final Exercise exercise;

  const ExerciseDetailPage({super.key, required this.exercise});

  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  int _secondsLeft = 0;
  Timer? _timer;

  void _startExercise() {
    setState(() {
      _secondsLeft = widget.exercise.duration;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() {
          _secondsLeft--;
        });
      } else {
        timer.cancel();
       // context.read<ExerciseBloc>().add(CompleteExercise(widget.exercise.id));
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Congratulations!"),
            content: const Text("Exercise Completed!"),
            actions: [
              TextButton(
                onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                child: const Text("OK"),
              )
            ],
          ),
        );
      }
    });
  }



  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final ex = widget.exercise;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ex.name,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF6A1B9A),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFCCC2DC), // light blue
               Color(0xFF625b71),// soft violet
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Description: ${ex.description}"),
              Text("Duration: ${ex.duration} seconds"),
              Text("Difficulty: ${ex.difficulty}"),
              const SizedBox(height: 20),
              _secondsLeft > 0
                  ? Center(
                child: Text("$_secondsLeft", style: const TextStyle(fontSize: 40)),
              )
                  : ElevatedButton(
                onPressed: _startExercise,
                child: const Text("Start"),
              ),
            ],
          ),
        ),
      ),

    );
  }
}