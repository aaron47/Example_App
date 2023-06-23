import 'package:get/get.dart';

class MatteController extends GetxController {
  var isMatte = false.obs;

  void changeMatte() {
    isMatte.value = !isMatte.value;
  }
}
