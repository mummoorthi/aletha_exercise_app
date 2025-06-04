import '../../domain/entity/exercise.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exercise_model.g.dart';

@JsonSerializable()
class ExerciseModel extends Exercise {

  ExerciseModel({
    required super.id,
    required super.name,
    required super.description,
    required super.duration,
    required super.difficulty,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    //duration: int.parse(json['duration']),
    duration: int.tryParse(json['duration'].toString()) ?? 0,
    difficulty: json['difficulty'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'duration': duration,
    'difficulty': difficulty,
  };
}