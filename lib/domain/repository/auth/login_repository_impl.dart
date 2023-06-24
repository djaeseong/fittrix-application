import 'package:fittrix_application/data/data_source/auth/login_service.dart';
import 'package:fittrix_application/domain/model/login/user_record.dart';
import 'package:fittrix_application/core/api_result.dart';
import 'package:fittrix_application/domain/repository/auth/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginService loginService;

  LoginRepositoryImpl(this.loginService);

  @override
  Future<ApiResult<UserRecord>> signInWithPassword(int password) async {
    final result = await loginService.signInWithPassword(password);

    return result.when(success: (success) {
      return ApiResult.success(data: success);
    }, error: (error) {
      return ApiResult.error(error);
    });
  }
}
