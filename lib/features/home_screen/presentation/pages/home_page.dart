import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/exercise_remote_datasource.dart';
import '../../data/repositories/exercise_repository_impl.dart';
import '../../domain/repositories/exercise_repository.dart';
import '../../domain/usecases/get_exercises_usecase.dart';
import '../bloc/exercise_bloc.dart';
import '../pages/exercise_detail_page.dart';
import 'package:aletha_health_task/core/network/api_client.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercises",
        style: TextStyle(color: Colors.white),
      ),

        backgroundColor: const Color(0xFF6A1B9A),
      ),
      body: BlocProvider(
        create: (_) => ExerciseBloc(GetExercisesUseCase(
          ExerciseRepositoryImpl(
            ExerciseRemoteDataSource(
              ApiClient(Dio()),
            ),
          ),
        ))..add(LoadExercises()),
    child: Container(
    decoration: const BoxDecoration(
    gradient: LinearGradient(
    colors: [
    Color(0xFFCCC2DC), // light blue
    Color(0xFF625b71), // soft violet
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    ),
        child: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            if (state is ExerciseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ExerciseLoaded) {
              return ListView.builder(
                itemCount: state.exercises.length,
                itemBuilder: (_, index) {
                  final exercise = state.exercises[index];
                  return ListTile(
                    title: Text(exercise.name),
                    subtitle: Text("${exercise.duration} seconds"),
                    trailing: exercise.isCompleted
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExerciseDetailPage(exercise: exercise),
                      ),
                    ),
                  );
                },
              );
            } else if (state is ExerciseError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    ));
  }
}