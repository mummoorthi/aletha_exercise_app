import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/exercise.dart';
import '../../domain/usecases/get_exercises_usecase.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final GetExercisesUseCase getExercisesUseCase;

  ExerciseBloc(this.getExercisesUseCase) : super(ExerciseInitial()) {
    on<LoadExercises>((event, emit) async {
      emit(ExerciseLoading());
      try {
        final exercises = await getExercisesUseCase();
        emit(ExerciseLoaded(exercises));
      } catch (e, stacktrace) {
        print(stacktrace); // optional, for deeper debugging
        emit(ExerciseError("Failed to load exercises"));
      }
    });

    on<CompleteExercise>((event, emit) {
      if (state is ExerciseLoaded) {
        final updated = (state as ExerciseLoaded).exercises.map((e) {
          if (e.id == event.exerciseId) e.isCompleted = true;
          return e;
        }).toList();
        emit(ExerciseLoaded(updated));
      }
    });
  }
}