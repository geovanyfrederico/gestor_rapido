import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
class InitView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController()); // Adicione o controller aqui

  InitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
      ),
      body:  Center(
          child:  ElevatedButton(
            onPressed: controller.goToTaskList,
            child: Text('Go to task list'),
          ),
      ),
    );
  }
}
