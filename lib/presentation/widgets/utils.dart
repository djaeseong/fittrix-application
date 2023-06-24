import 'package:fittrix_application/presentation/widgets/enum_type.dart';

String workoutTypeToTitle(WorkoutType type) {
  switch (type) {
    case WorkoutType.lunge:
      return "런지";
    case WorkoutType.squat:
      return "스쿼트";
    case WorkoutType.pushup:
      return "푸시업";
    case WorkoutType.legRaise:
      return "레그레이즈";
    default:
      return "";
  }
}
