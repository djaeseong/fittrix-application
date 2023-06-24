import 'package:dio/dio.dart';
import 'package:fittrix_application/core/api_result.dart';
import 'package:fittrix_application/core/dio_client.dart';
import 'package:fittrix_application/data/data_source/auth/login_service.dart';
import 'package:fittrix_application/domain/model/login/user_record.dart';

class LoginServiceImpl implements LoginService {
  final DioClient _dioClient;
  LoginServiceImpl(this._dioClient);

  @override
  Future<ApiResult<UserRecord>> signInWithPassword(int password) async {
    try {
      final result = await _dioClient.get('login/$password');

      print(result);

      return ApiResult.success(data: UserRecord.fromJson(result.data));
    } on DioException catch (e) {
      return ApiResult.error(e);
    }
  }
}
