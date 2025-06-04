import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../model/exercise_model.dart';

class ExerciseRemoteDataSource {
  final ApiClient apiClient;

  ExerciseRemoteDataSource(this.apiClient);

  Future<List<ExerciseModel>> getExercises()  {
    return  apiClient.getExercises(); // This is fine if apiClient returns a Future
  }
}