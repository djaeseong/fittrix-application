import 'package:fittrix_application/domain/model/workout/workout_record.dart';
import 'package:fittrix_application/domain/model/workout/workout_request.dart';
import 'package:fittrix_application/domain/use_case/create_workout_use_case.dart';
import 'package:fittrix_application/presentation/widgets/enum_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordWorkoutScreenViewModel extends GetxController {
  final CreateWorkoutUseCase createWorkoutUseCase;

  RecordWorkoutScreenViewModel({required this.createWorkoutUseCase});

  @override
  void onInit() {
    _workoutType.value = workoutTypeStringToEnum(Get.parameters['workoutName']!);
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }

  final _workoutType = WorkoutType.lunge.obs;
  get workoutType => _workoutType.value;

  final _textEditingController = TextEditingController();
  get textEditingController => _textEditingController;

  final _nowDateTime = DateTime.now().toLocal().obs;
  get nowDateTime => _nowDateTime.value;

  final _workoutRecord = WorkoutRecord(
    createdAt: 0,
    remark: '',
    id: '',
    loginId: '',
    workoutType: '',
  ).obs;
  get workoutRecord => _workoutRecord.value;

  Future<bool> createWorkout({
    required String remark,
    required DateTime now,
  }) async {
    final request = WorkoutRequest(
      remark: remark,
      createdAt: now.millisecondsSinceEpoch,
      workoutType: workoutTypeEnumToString(workoutType),
    );

    final result = await createWorkoutUseCase(request);

    return result.when(success: (success) {
      _workoutRecord.value = success!;
      return true;
    }, error: (error) {
      return false;
    });
  }
}
