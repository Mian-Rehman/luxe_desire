import 'package:get/get.dart';

class UserprofileController extends GetxController {
  final isDark = false.obs;
  var emailCheck = true.obs;
  var phoneCheck = true.obs;
  var pushCheck = true.obs;

  checkEmail() {
    emailCheck.value = !emailCheck.value;
    update();
  }

  checkPhone() {
    phoneCheck.value = !phoneCheck.value;
    update();
  }

  checkPush() {
    pushCheck.value = !pushCheck.value;
    update();
  }
}
