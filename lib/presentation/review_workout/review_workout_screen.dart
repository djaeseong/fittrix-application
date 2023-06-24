import 'package:fittrix_application/presentation/main/main_screen_view_model.dart';
import 'package:fittrix_application/presentation/review_workout/review_workout_screen_view_model.dart';
import 'package:fittrix_application/presentation/widgets/list_item/workout_record_list_item.dart';
import 'package:fittrix_application/presentation/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewWorkoutScreen extends StatefulWidget {
  const ReviewWorkoutScreen({super.key});

  @override
  State<ReviewWorkoutScreen> createState() => _ReviewWorkoutScreenState();
}

class _ReviewWorkoutScreenState extends State<ReviewWorkoutScreen> {
  final screenViewModel = Get.find<ReviewWorkoutScreenViewModel>();
  final mainViewModel = Get.find<MainScreenViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(workoutTypeToTitle(mainViewModel.workoutType)),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => screenViewModel.isFetchLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Obx(
                  () => SingleChildScrollView(
                    controller: screenViewModel.scrollController,
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        Obx(
                          () => ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final workoutRercord = screenViewModel.workoutRecordList[index];

                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: WorkoutRecordListItem(
                                  workoutCreatedAt: DateTime.fromMillisecondsSinceEpoch(workoutRercord.createdAt).toLocal().toString(),
                                  workoutRemark: workoutRercord.remark,
                                ),
                              );
                            },
                            itemCount: screenViewModel.workoutRecordList.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 8);
                            },
                          ),
                        ),
                        Obx(() => screenViewModel.isMoreLoading ? CircularProgressIndicator() : Container()),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
