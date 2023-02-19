import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: controller.goToTaskList,
          child: const Text('Go to task list'),
        ),
      ),
    );
  }
}
