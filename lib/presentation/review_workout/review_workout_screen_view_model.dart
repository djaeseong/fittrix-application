import 'package:fittrix_application/domain/model/workout/workout_record.dart';
import 'package:fittrix_application/domain/use_case/fetch_workout_by_type_page.dart';
import 'package:fittrix_application/presentation/main/main_screen_view_model.dart';
import 'package:fittrix_application/presentation/widgets/enum_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewWorkoutScreenViewModel extends GetxController {
  final FetchWorkoutByTypePageUseCase fetchWorkoutByTypePageUseCase;

  ReviewWorkoutScreenViewModel({required this.fetchWorkoutByTypePageUseCase});

  final mainViewModel = Get.find<MainScreenViewModel>();

  @override
  void onInit() {
    _scrollController.value.addListener(() {
      if (_scrollController.value.position.pixels == _scrollController.value.position.maxScrollExtent) {
        fetchWorkoutByTypePage(workoutTypeEnumToString(mainViewModel.workoutType), page: page);
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    _scrollController.value.dispose();
    super.dispose();
  }

  final _scrollController = ScrollController().obs;
  get scrollController => _scrollController.value;

  final _isMoreLoading = true.obs;
  get isMoreLoading => _isMoreLoading.value;

  final _page = 1.obs;
  get page => _page.value;

  final _workoutType = WorkoutType.lunge.obs;
  get workoutType => _workoutType.value;

  final _workoutRecordList = <WorkoutRecord>[].obs;
  get workoutRecordList => _workoutRecordList;

  final _isFetchLoading = true.obs;
  get isFetchLoading => _isFetchLoading.value;

  changeMoreLoadingStatus(bool value) {
    _isMoreLoading.value = value;
  }

  changeFetchLoadingStatus(bool value) {
    _isFetchLoading.value = value;
  }

  addWorkoutRecord(WorkoutRecord record) {
    _workoutRecordList.insert(0, record);
  }

  Future<void> fetchWorkoutByTypePage(String workoutType, {int? page, int? size}) async {
    if (page == null) {
      _workoutRecordList.clear();
      changeFetchLoadingStatus(true);
    }

    final result = await fetchWorkoutByTypePageUseCase(workoutType, page: page, size: size ?? 7);

    result.when(success: (success) {
      _workoutRecordList.addAll(success!);
      success.isNotEmpty ? _page.value++ : changeMoreLoadingStatus(false);
      changeFetchLoadingStatus(false);
    }, error: (error) {
      changeFetchLoadingStatus(false);
    });
  }
}
