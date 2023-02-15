import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
import 'package:get/instance_manager.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // 종료시점까지 살아있게
    Get.put(BottomNavController(), permanent: true);
  }
}
