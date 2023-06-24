import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_record.freezed.dart';
part 'workout_record.g.dart';

@freezed
class WorkoutRecord with _$WorkoutRecord {
  factory WorkoutRecord({
    required int createdAt,
    required String remark,
    required String id,
    required String loginId,
    required String workoutType,
  }) = _WorkoutRecord;

  factory WorkoutRecord.fromJson(Map<String, dynamic> json) => _$WorkoutRecordFromJson(json);
}
