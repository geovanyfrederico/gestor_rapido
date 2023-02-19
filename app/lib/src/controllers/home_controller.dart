import 'package:get/get.dart';

class HomeController extends GetxController {
  final title = 'Inicio'.obs;

  void goToTaskList() {
    Get.toNamed('/task-list');
  }
}
