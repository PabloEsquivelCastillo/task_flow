import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flow/features/tasks/presentation/viewmodels/task_viewmodel.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    //watch() obtiene el taskvm mediante ChangeNProvider, escucha sus notis
    final vm = context.watch<TaskViewModel>();
    final tareas = vm.tareas;

    return Scaffold(
      appBar: AppBar(title: const Text('TaskFlow')),
      body: Center(
        child: vm.cargando
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: tareas.length,
                itemBuilder: (context, index) {
                  final tarea = tareas[index];
                  return ListTile(
                    title: Text(tarea.titulo),
                    subtitle: Text(tarea.descripcion),
                    leading: IconButton(
                      icon: Icon(
                        tarea.completada ? Icons.check_circle  : Icons.radio_button_unchecked,
                        color: tarea.completada ? Colors.deepOrange : Colors.grey,
                      ),
                      onPressed: () {
                        context.read<TaskViewModel>().cambiarEstadoTarea(tarea.id);
                      },
                    )
                  );
                },
              ),
      ),
    );
  }
}
