import 'package:fittrix_application/core/api_result.dart';
import 'package:fittrix_application/data/data_source/workout/workout_service.dart';
import 'package:fittrix_application/domain/model/workout/workout_record.dart';
import 'package:fittrix_application/domain/model/workout/workout_request.dart';
import 'package:fittrix_application/domain/repository/workout/workout_repository.dart';

class WorkoutRepositoryImpl implements WorkoutRepository {
  final WorkoutService workoutService;

  WorkoutRepositoryImpl(this.workoutService);

  @override
  Future<ApiResult<WorkoutRecord>> createWorkout(WorkoutRequest request) async {
    final result = await workoutService.createWorkout(request);

    return result.when(success: (success) {
      return ApiResult.success(data: success);
    }, error: (error) {
      return ApiResult.error(error);
    });
  }

  @override
  Future<ApiResult<List<WorkoutRecord>>> fetchWorkoutByTypePage(String workoutType, {int? page, int? size}) async {
    final result = await workoutService.fetchWorkoutByTypePage(workoutType, page: page, size: size);

    return result.when(success: (success) {
      return ApiResult.success(data: success);
    }, error: (error) {
      return ApiResult.error(error);
    });
  }
}
