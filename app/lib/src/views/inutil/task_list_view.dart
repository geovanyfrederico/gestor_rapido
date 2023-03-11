import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/controllers/task_list_controller.dart';

class TaskListView extends StatelessWidget {
   final TaskListController controller = Get.put(TaskListController()); // Adicione o controller aqui

   TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task list'),
      ),
      body: Obx(
            () =>
            ListView.builder(
              itemCount: controller.taskList.length,
              itemBuilder: (context, index) {
                final task = controller.taskList[index];

                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: IconButton(
                    icon: task.isCompleted
                        ? const Icon(Icons.check_box)
                        : const Icon(Icons.check_box_outline_blank),
                    onPressed: () => controller.markTaskAsCompleted(task),
                  ),
                  onTap: () => Get.toNamed('/task-form', arguments: task),
                );
              },
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/task-form'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
