import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templates/src/controllers/task_form_controller.dart';

class TaskFormView extends StatelessWidget {

  final TaskFormController controller = Get.put(TaskFormController());

   TaskFormView({super.key}); // Adicione o controller aqui

  @override
  Widget build(BuildContext context) {
    controller.titleController.text = '';
    controller.descriptionController.text =  '';
    controller.isCompleted.value =  false;
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Add task' ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
                onPressed:  controller.saveTask,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
