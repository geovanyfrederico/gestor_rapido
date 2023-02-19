import 'package:get/get.dart';
import 'package:templates/src/models/task_model.dart';
import 'package:templates/src/repositories/task_repository.dart';

class AuthController extends GetxController {
  final taskList = <Task>[].obs;
  final repository = TaskRepository();
}
