import '../entity/exercise.dart';

abstract class ExerciseRepository {
  Future<List<Exercise>> getExercises();
}
