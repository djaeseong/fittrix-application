import 'package:fittrix_application/presentation/home/home_screen_view_model.dart';
import 'package:get/get.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeScreenViewModel(),
    );
  }
}
