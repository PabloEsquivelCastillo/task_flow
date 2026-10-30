import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flow/features/tasks/presentation/viewmodels/task_viewmodel.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  final _formKey = GlobalKey<FormState>();

  final tituloControlador = TextEditingController();
  final descripcionControlador = TextEditingController();

  @override
  void dispose() {
    tituloControlador.dispose();
    descripcionControlador.dispose();
    super.dispose();
  }

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
                        tarea.completada
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: tarea.completada
                            ? Colors.deepOrange
                            : Colors.grey,
                      ),
                      onPressed: () {
                        context.read<TaskViewModel>().cambiarEstadoTarea(
                          tarea.id,
                        );
                      },
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Nueva tarea'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: tituloControlador,
                        decoration: const InputDecoration(
                          labelText: "Nombre de la tarea",
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'El título es obligatorio';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        controller: descripcionControlador,
                        decoration: const InputDecoration(
                          labelText: "Descripción",
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final titulo = tituloControlador.text.trim();
                        final descripcion = descripcionControlador.text.trim();

                        await context.read<TaskViewModel>().crearTarea(
                          titulo,
                          descripcion,
                        );
                        tituloControlador.clear();
                        descripcionControlador.clear();

                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Guardar'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
