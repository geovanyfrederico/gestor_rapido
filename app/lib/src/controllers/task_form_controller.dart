import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gr/src/models/task_model.dart';
import 'package:gr/src/repositories/task_repository.dart';

class TaskFormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final isCompleted = false.obs;
  final repository = TaskRepository();

  void saveTask() async {
    if (formKey.currentState!.validate()) {
      final task = Task(
        title: titleController.text,
        description: descriptionController.text,
        isCompleted: isCompleted.value,
      );
      await repository.addTask(task);
      Get.back();
    }
  }

  void updateTask(Task task) async {
    if (formKey.currentState!.validate()) {
      task.title = titleController.text;
      task.description = descriptionController.text;
      task.isCompleted = isCompleted.value;
      await repository.updateTask(task);
      Get.back();
    }
  }
}
