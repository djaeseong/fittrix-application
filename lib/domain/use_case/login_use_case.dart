import 'package:fittrix_application/core/api_result.dart';
import 'package:fittrix_application/domain/model/login/user_record.dart';
import 'package:fittrix_application/domain/repository/auth/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<ApiResult<UserRecord>> call(int password) async {
    final result = await loginRepository.signInWithPassword(password);

    return result.when(success: (success) {
      return ApiResult.success(data: success);
    }, error: (error) {
      return ApiResult.error(error);
    });
  }
}
