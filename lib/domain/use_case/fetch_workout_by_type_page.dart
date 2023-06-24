import 'package:fittrix_application/core/api_result.dart';
import 'package:fittrix_application/domain/model/workout/workout_record.dart';
import 'package:fittrix_application/domain/repository/workout/workout_repository.dart';

class FetchWorkoutByTypePageUseCase {
  final WorkoutRepository _workoutRepository;

  FetchWorkoutByTypePageUseCase(this._workoutRepository);

  Future<ApiResult<List<WorkoutRecord>>> call(String workoutType, {int? page, int? size}) async {
    final result = await _workoutRepository.fetchWorkoutByTypePage(workoutType, page: page, size: size);

    return result.when(success: (success) {
      return ApiResult.success(data: success);
    }, error: (error) {
      return ApiResult.error(error);
    });
  }
}
