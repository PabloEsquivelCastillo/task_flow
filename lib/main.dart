import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flow/features/tasks/domain/repositories/memory_task_repository.dart';
import 'package:task_flow/features/tasks/presentation/viewmodels/task_viewmodel.dart';
import 'package:task_flow/features/tasks/presentation/views/task_list_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider<TaskViewModel>(
      create: (context) {
        //Creamos el repositorio y lo enviamos al viewmodel
        final repository = MemoryTaskRepository();
        return TaskViewModel(repository: repository)
          ..cargarTareas();
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskFlow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const TaskListView(),
    );
  }
}
