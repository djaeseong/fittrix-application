import 'package:fittrix_application/core/api_result.dart';
import 'package:fittrix_application/domain/model/workout/workout_record.dart';
import 'package:fittrix_application/domain/model/workout/workout_request.dart';
import 'package:fittrix_application/domain/repository/workout/workout_repository.dart';

class CreateWorkoutUseCase {
  final WorkoutRepository workoutRepository;

  CreateWorkoutUseCase(this.workoutRepository);

  Future<ApiResult<WorkoutRecord>> call(WorkoutRequest request) async {
    final result = await workoutRepository.createWorkout(request);

    return result.when(success: (success) {
      return ApiResult.success(data: success);
    }, error: (error) {
      return ApiResult.error(error);
    });
  }
}
