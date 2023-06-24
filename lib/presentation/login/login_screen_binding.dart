import 'package:fittrix_application/core/dio_client.dart';
import 'package:fittrix_application/data/data_source/auth/login_service_impl.dart';
import 'package:fittrix_application/domain/repository/auth/login_repository_impl.dart';
import 'package:fittrix_application/domain/use_case/login_use_case.dart';
import 'package:fittrix_application/presentation/login/login_screen_view_model.dart';
import 'package:get/get.dart';

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginScreenViewModel(
        loginUseCase: LoginUseCase(
          LoginRepositoryImpl(
            LoginServiceImpl(
              DioClient(),
            ),
          ),
        ),
      ),
    );
  }
}
