import 'package:get/get.dart';

import '../controllers/guest_controller.dart';

class AddMusicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuestController>(
      () => GuestController(),
    );
  }
}
