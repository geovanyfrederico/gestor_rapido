import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templates/src/views/home_view.dart';
import 'package:templates/src/views/init_view.dart';
import 'package:templates/src/views/task_form_view.dart';
import 'package:templates/src/views/task_list_view.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      initialRoute: '/init',
      getPages: [
        GetPage(name: '/', page: () => const HomeView()),
        GetPage(name: '/init', page: () =>  InitView()),
        GetPage(name: '/task-list', page: () =>   TaskListView()),
        GetPage(name: '/task-form', page: () =>   TaskFormView()),
      ],
    );
  }
}
