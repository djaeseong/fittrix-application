import 'package:fittrix_application/presentation/main/main_screen_view_model.dart';
import 'package:get/get.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MainScreenViewModel(),
    );
  }
}
