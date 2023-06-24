import 'package:cached_network_image/cached_network_image.dart';
import 'package:fittrix_application/core/f_img_url.dart';
import 'package:fittrix_application/presentation/record_workout/record_workout_screen_view_model.dart';
import 'package:fittrix_application/presentation/widgets/enum_type.dart';
import 'package:fittrix_application/presentation/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RecordWorkoutScreen extends StatefulWidget {
  const RecordWorkoutScreen({super.key});

  @override
  State<RecordWorkoutScreen> createState() => _RecordWorkoutScreenState();
}

class _RecordWorkoutScreenState extends State<RecordWorkoutScreen> {
  final screenViewModel = Get.find<RecordWorkoutScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workoutTypeToTitle(screenViewModel.workoutType)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              screenViewModel.workoutType == WorkoutType.lunge
                  ? Container(
                      child: CachedNetworkImage(imageUrl: FImgUrl.lungeImg),
                    )
                  : screenViewModel.workoutType == WorkoutType.squat
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CachedNetworkImage(imageUrl: FImgUrl.squatImg),
                        )
                      : screenViewModel.workoutType == WorkoutType.pushup
                          ? Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: CachedNetworkImage(imageUrl: FImgUrl.pushUpImg),
                            )
                          : screenViewModel.workoutType == WorkoutType.legRaise
                              ? Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: CachedNetworkImage(imageUrl: FImgUrl.legRaiseImg),
                                )
                              : Container(),
              const SizedBox(height: 16),
              Text('현재 시간'),
              Obx(
                () => Text(
                  DateFormat('yyyy년 MM월 dd일 hh:mm').format(
                    screenViewModel.nowDateTime,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text('상태 메세지를 입력해주세요'),
              TextField(
                controller: screenViewModel.textEditingController,
                autofocus: true,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ElevatedButton(
                  onPressed: () async {
                    final result = await screenViewModel.createWorkout(
                      remark: screenViewModel.textEditingController.text.trim(),
                      now: screenViewModel.nowDateTime,
                    );
                    if (result) {
                      Get.back(result: screenViewModel.workoutRecord);
                    }
                  },
                  child: Text('기록하기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
