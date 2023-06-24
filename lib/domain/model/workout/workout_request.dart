import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_request.freezed.dart';
part 'workout_request.g.dart';

@freezed
class WorkoutRequest with _$WorkoutRequest {
  factory WorkoutRequest({
    required int createdAt,
    required String remark,
    required String workoutType,
  }) = _WorkoutRequest;

  factory WorkoutRequest.fromJson(Map<String, dynamic> json) => _$WorkoutRequestFromJson(json);
}
