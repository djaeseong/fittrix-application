import 'package:fittrix_application/presentation/widgets/enum_type.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MainScreenViewModel extends GetxController {
  final _currentIndex = 0.obs;
  get currentIndex => _currentIndex.value;

  final _workoutType = WorkoutType.lunge.obs;
  get workoutType => _workoutType.value;

  changeWorkoutType(WorkoutType type) {
    _workoutType.value = type;
  }

  changeCurrentIndex(int index, {WorkoutType? type}) {
    _currentIndex.value = index;
    if (index == 1) {
      changeWorkoutType(type!);
    }
    Logger().d(_workoutType.value);
  }

  onTapNavigationBarItem(int index) {
    changeCurrentIndex(index);
  }
}
