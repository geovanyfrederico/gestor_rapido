import 'package:get/get.dart';
import 'package:templates/src/models/task_model.dart';
import 'package:templates/src/repositories/task_repository.dart';

class TaskListController extends GetxController {
  final taskList = <Task>[].obs;
  final repository = TaskRepository();

  @override
  void onInit() {
    super.onInit();

    getTasks();
  }

  void getTasks() async {
    final tasks = await repository.getAllTasks();

    taskList.assignAll(tasks);
  }

  void markTaskAsCompleted(Task task) async {
    task.isCompleted = true;

    await repository.updateTask(task);

    getTasks();
  }

  void deleteTask(Task task) async {
    await repository.deleteTask(task.id);

    getTasks();
  }
}
