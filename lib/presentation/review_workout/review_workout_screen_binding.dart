import 'package:fittrix_application/core/dio_client.dart';
import 'package:fittrix_application/data/data_source/workout/workout_service_impl.dart';
import 'package:fittrix_application/domain/repository/workout/workout_repository_impl.dart';
import 'package:fittrix_application/domain/use_case/fetch_workout_by_type_page.dart';
import 'package:fittrix_application/presentation/review_workout/review_workout_screen_view_model.dart';
import 'package:get/get.dart';

class ReviewWorkoutScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ReviewWorkoutScreenViewModel(
        fetchWorkoutByTypePageUseCase: FetchWorkoutByTypePageUseCase(
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
