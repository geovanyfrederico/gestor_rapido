import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templates/src/controllers/task_form_controller.dart';
import 'package:templates/src/models/task_model.dart';

class TaskFormView extends GetView<TaskFormController> {
  @override
  Widget build(BuildContext context) {
    final task = Get.arguments as Task;

    controller.titleController.text = task.title ?? '';
    controller.descriptionController.text = task.description ?? '';
    controller.isCompleted.value = task.isCompleted ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text(task == null ? 'Add task' : 'Edit task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.isCompleted.value,
                      onChanged: (value) => controller.isCompleted.value = value!,
                    ),
                  ),
                  Text('Completed'),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: task == null ? controller.saveTask : () => controller.updateTask(task),
                child: Text(task == null ? 'Save' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
