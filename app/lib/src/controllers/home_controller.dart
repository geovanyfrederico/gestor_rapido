import 'package:get/get.dart';

class HomeController extends GetxController {
  final title = 'My App'.obs;

  void goToTaskList() {
    Get.toNamed('/task-list');
  }
}
