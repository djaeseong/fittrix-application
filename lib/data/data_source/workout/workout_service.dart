import 'package:fittrix_application/core/api_result.dart';
import 'package:fittrix_application/domain/model/workout/workout_record.dart';
import 'package:fittrix_application/domain/model/workout/workout_request.dart';

abstract class WorkoutService {
  Future<ApiResult<WorkoutRecord>> createWorkout(WorkoutRequest request);

  Future<ApiResult<List<WorkoutRecord>>> fetchWorkoutByTypePage(String workoutType, {int? page, int? size});
}
