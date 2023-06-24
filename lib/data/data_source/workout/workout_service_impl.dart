import 'package:dio/dio.dart';
import 'package:fittrix_application/core/api_result.dart';
import 'package:fittrix_application/core/dio_client.dart';
import 'package:fittrix_application/core/f_secure_storage.dart';
import 'package:fittrix_application/data/data_source/workout/workout_service.dart';
import 'package:fittrix_application/domain/model/workout/workout_record.dart';
import 'package:fittrix_application/domain/model/workout/workout_request.dart';
import 'package:logger/logger.dart';

class WorkoutServiceImpl implements WorkoutService {
  final DioClient dioClient;

  WorkoutServiceImpl(this.dioClient);

  @override
  Future<ApiResult<WorkoutRecord>> createWorkout(WorkoutRequest request) async {
    try {
      Logger().d(request);
      final userId = await FSecureStorage.getPassword();
      final result = await dioClient.post('login/$userId/workout', data: request.toJson());

      return ApiResult.success(data: WorkoutRecord.fromJson(result.data));
    } on DioException catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<List<WorkoutRecord>>> fetchWorkoutByTypePage(String workoutType, {int? page, int? size}) async {
    try {
      final userId = await FSecureStorage.getPassword();
      final result = await dioClient.get(
        'login/$userId/workout',
        params: {
          "workoutType": workoutType,
          "page": page ?? 1,
          "limit": size ?? 10,
          "sortBy": "createdAt",
          "order": "desc",
        },
      );
      print(result);

      return ApiResult.success(data: (result.data as List).map((e) => WorkoutRecord.fromJson(e)).toList());
    } on DioException catch (e) {
      return ApiResult.error(e);
    }
  }
}
