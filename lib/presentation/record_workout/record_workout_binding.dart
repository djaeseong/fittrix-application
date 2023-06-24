import 'package:fittrix_application/core/dio_client.dart';
import 'package:fittrix_application/data/data_source/workout/workout_service_impl.dart';
import 'package:fittrix_application/domain/repository/workout/workout_repository_impl.dart';
import 'package:fittrix_application/domain/use_case/create_workout_use_case.dart';
import 'package:fittrix_application/presentation/record_workout/record_workout_screen_view_model.dart';
import 'package:get/get.dart';

class RecordWorkoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RecordWorkoutScreenViewModel(
        createWorkoutUseCase: CreateWorkoutUseCase(
          WorkoutRepositoryImpl(
            WorkoutServiceImpl(
              DioClient(),
            ),
          ),
        ),
      ),
    );
  }
}
