import 'package:fittrix_application/core/api_result.dart';
import 'package:fittrix_application/domain/model/login/user_record.dart';

abstract class LoginService {
  Future<ApiResult<UserRecord>> signInWithPassword(int password);
}
