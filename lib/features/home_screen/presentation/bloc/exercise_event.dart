part of 'exercise_bloc.dart';

abstract class ExerciseEvent {}

class LoadExercises extends ExerciseEvent {}

class CompleteExercise extends ExerciseEvent {
  final String exerciseId;
  CompleteExercise(this.exerciseId);
}