import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../Features/home_screen/data/model/exercise_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://68252ec20f0188d7e72c394f.mockapi.io/dev")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/workouts")
  Future<List<ExerciseModel>> getExercises();
}