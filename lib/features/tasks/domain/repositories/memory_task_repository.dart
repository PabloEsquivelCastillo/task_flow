import 'package:task_flow/features/tasks/domain/repositories/task_repository.dart';
import 'package:task_flow/features/tasks/domain/entities/task.dart';

class MemoryTaskRepository implements TaskRepository {
  //Lista privada _ llamada _tareas vacía
  final List<Task> _tareas = [
    Task(id: '1',
        titulo: 'Estudiar',
        descripcion: 'Mvvm, provider',
        completada: false),
    Task(id: '2', titulo: 'Comer', descripcion: 'Comer rico', completada: true)
  ];

  @override
  Future<List<Task>> obtenerTareas() async => List.unmodifiable(_tareas);

  @override
  Future<void> agregarTarea(Task task) async {
    _tareas.add(task);
  }

  @override
  Future<void> actualizarTarea(Task task) async {
    final index = _tareas.indexWhere((i) => i.id == task.id);

    if (index != -1) {
      _tareas[index] = task;
    }
  }

  @override
  Future<Task?> actualizarEstado(String id, bool completada) async {
    final index = _tareas.indexWhere((i) => i.id == id);

    if (index == -1) {
      return null;
    }

    final tarea = _tareas[index];

    //Creamos instancia de task con la modificación en completada
    final tareaActualizada = Task(
        id: tarea.id,
        titulo: tarea.titulo,
        descripcion: tarea.descripcion,
        completada: completada,
    );

    //Incertamos la instancia en la posición og de la instancia a modificar
    _tareas[index] = tareaActualizada;

    return tareaActualizada;
  }

  @override
  Future<void> eliminarTarea(String id) async {
    _tareas.removeWhere((i) => i.id == id);
  }
}
