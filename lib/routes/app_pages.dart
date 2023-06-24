import 'package:fittrix_application/presentation/login/login_screen.dart';
import 'package:fittrix_application/presentation/login/login_screen_binding.dart';
import 'package:fittrix_application/presentation/main/main_screen.dart';
import 'package:fittrix_application/presentation/main/main_screen_binding.dart';
import 'package:fittrix_application/presentation/record_workout/record_workout_binding.dart';
import 'package:fittrix_application/presentation/record_workout/record_workout_screen.dart';
import 'package:fittrix_application/presentation/review_workout/review_workout_screen.dart';
import 'package:fittrix_application/presentation/review_workout/review_workout_screen_binding.dart';
import 'package:fittrix_application/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.main,
      page: () => const MainScreen(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => const MainScreen(),
      bindings: [
        MainScreenBinding(),
        RecordWorkoutBinding(),
        ReviewWorkoutScreenBinding(),
        LoginScreenBinding(),
      ],
    ),
    GetPage(
      name: Routes.recordWorkoutScreen,
      page: () => const RecordWorkoutScreen(),
      binding: RecordWorkoutBinding(),
    ),
    GetPage(
      name: Routes.reviewWorkoutScreen,
      page: () => const ReviewWorkoutScreen(),
      binding: ReviewWorkoutScreenBinding(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginScreenBinding(),
    ),
  ];
}
