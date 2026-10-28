import 'package:task_flow/features/tasks/domain/repositories/task_repository.dart';
import 'package:task_flow/features/tasks/domain/entities/task.dart';

class MemoryTaskRepository implements TaskRepository {
  //Lista privada _ llamada _tareas vacía
  final List<Task> _tareas = [];

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
  Future<void> eliminarTarea(String id) async {
    _tareas.removeWhere((i) => i.id == id);
  }
}
