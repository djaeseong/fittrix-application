import 'package:fittrix_application/presentation/home/home_screen.dart';
import 'package:fittrix_application/presentation/login/login_screen.dart';
import 'package:fittrix_application/presentation/login/login_screen_view_model.dart';
import 'package:fittrix_application/presentation/main/main_screen_view_model.dart';
import 'package:fittrix_application/presentation/review_workout/review_workout_screen.dart';
import 'package:fittrix_application/presentation/review_workout/review_workout_screen_view_model.dart';
import 'package:fittrix_application/presentation/widgets/bottom_sheet/list_bottom_sheet.dart';
import 'package:fittrix_application/presentation/widgets/enum_type.dart';
import 'package:fittrix_application/presentation/widgets/list_item/bottom_sheet_list_item.dart';
import 'package:fittrix_application/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screenViewModel = Get.find<MainScreenViewModel>();
  final loginViewModel = Get.find<LoginScreenViewModel>();
  final reviewViewModel = Get.find<ReviewWorkoutScreenViewModel>();

  final _pages = [
    const HomeScreen(),
    const ReviewWorkoutScreen(),
    const LoginScreen(),
  ];

  Future<bool> onWillPop() async {
    SystemNavigator.pop();
    return true;
  }

  _onTap(int index) {
    if (index == 0) {
      loginViewModel.isLoggined
          ? Get.bottomSheet(
              ListBottomSheet(
                child: Column(
                  children: [
                    BottomSheetListItem(
                        label: '런지',
                        onTap: () {
                          Get.back();
                          Get.toNamed(
                            Routes.recordWorkoutScreen,
                            parameters: {'workoutName': workoutTypeEnumToString(WorkoutType.lunge)},
                          )!
                              .then((value) {
                            if (value != null && value.workoutType == 'Lunge') {
                              reviewViewModel.addWorkoutRecord(value);
                            }
                          });
                        }),
                    BottomSheetListItem(
                        label: '스쿼트',
                        onTap: () {
                          Get.back();
                          Get.toNamed(
                            Routes.recordWorkoutScreen,
                            parameters: {'workoutName': workoutTypeEnumToString(WorkoutType.squat)},
                          )!
                              .then((value) {
                            if (value != null && value.workoutType == 'Squat') {
                              reviewViewModel.addWorkoutRecord(value);
                            }
                          });
                        }),
                    BottomSheetListItem(
                        label: '푸시업',
                        onTap: () {
                          Get.back();
                          Get.toNamed(
                            Routes.recordWorkoutScreen,
                            parameters: {'workoutName': workoutTypeEnumToString(WorkoutType.pushup)},
                          )!
                              .then((value) {
                            if (value != null && value.workoutType == 'Pushup') {
                              reviewViewModel.addWorkoutRecord(value);
                            }
                          });
                        }),
                    BottomSheetListItem(
                        label: '레그 레이즈',
                        onTap: () {
                          Get.back();
                          Get.toNamed(
                            Routes.recordWorkoutScreen,
                            parameters: {'workoutName': workoutTypeEnumToString(WorkoutType.legRaise)},
                          )!
                              .then((value) {
                            if (value != null && value.workoutType == 'LegRaise') {
                              reviewViewModel.addWorkoutRecord(value);
                            }
                          });
                        }),
                  ],
                ),
              ),
            ).then(
              (value) => print(value),
            )
          : Get.snackbar(
              '로그인 필요',
              '로그인 페이지에서 로그인해주세요',
            );
    }
    if (index == 1) {
      loginViewModel.isLoggined
          ? Get.bottomSheet(
              ListBottomSheet(
                child: Column(
                  children: [
                    BottomSheetListItem(
                        label: '런지',
                        onTap: () {
                          Get.back();
                          screenViewModel.changeCurrentIndex(1, type: WorkoutType.lunge);
                          reviewViewModel.fetchWorkoutByTypePage(workoutTypeEnumToString(screenViewModel.workoutType));
                        }),
                    BottomSheetListItem(
                        label: '스쿼트',
                        onTap: () {
                          Get.back();
                          screenViewModel.changeCurrentIndex(1, type: WorkoutType.squat);
                          reviewViewModel.fetchWorkoutByTypePage(workoutTypeEnumToString(screenViewModel.workoutType));
                        }),
                    BottomSheetListItem(
                        label: '푸시업',
                        onTap: () {
                          Get.back();
                          screenViewModel.changeCurrentIndex(1, type: WorkoutType.pushup);
                          reviewViewModel.fetchWorkoutByTypePage(workoutTypeEnumToString(screenViewModel.workoutType));
                        }),
                    BottomSheetListItem(
                        label: '레그 레이즈',
                        onTap: () {
                          Get.back();
                          screenViewModel.changeCurrentIndex(1, type: WorkoutType.legRaise);
                          reviewViewModel.fetchWorkoutByTypePage(workoutTypeEnumToString(screenViewModel.workoutType));
                        }),
                  ],
                ),
              ),
            ).then((value) => print(value))
          : Get.snackbar(
              '로그인 필요',
              '로그인 페이지에서 로그인해주세요',
            );
    }
    if (index == 2) {
      screenViewModel.changeCurrentIndex(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Obx(
        () => Scaffold(
          body: _pages[screenViewModel.currentIndex],
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              onTap: _onTap,
              currentIndex: screenViewModel.currentIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.text_snippet_outlined,
                    size: 30.0,
                  ),
                  label: '',
                  tooltip: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.pie_chart_outline_outlined,
                    size: 30.0,
                  ),
                  label: '',
                  tooltip: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_outlined,
                    size: 30.0,
                  ),
                  label: '',
                  tooltip: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
