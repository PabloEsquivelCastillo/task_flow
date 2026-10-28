import 'package:task_flow/features/tasks/domain/entities/task.dart';

abstract class TaskRepository {

  Future<List<Task>> obtenerTareas();

  Future<void> agregarTarea(Task task);

  Future<void> actualizarTarea(Task task);

  Future<void> eliminarTarea(String id);
  
}