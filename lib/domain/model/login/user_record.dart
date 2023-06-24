import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_record.freezed.dart';
part 'user_record.g.dart';

@freezed
class UserRecord with _$UserRecord {
  factory UserRecord({
    required String createdAt,
    required String avatar,
    required int userId,
    required String id,
  }) = _UserRecord;

  factory UserRecord.fromJson(Map<String, dynamic> json) =>
      _$UserRecordFromJson(json);
}
