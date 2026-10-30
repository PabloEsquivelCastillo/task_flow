import 'package:flutter/material.dart';
import 'package:task_flow/features/tasks/domain/entities/task.dart';
import 'package:task_flow/features/tasks/domain/repositories/task_repository.dart';
import 'package:uuid/uuid.dart';


class TaskViewModel extends ChangeNotifier {

  final TaskRepository _repository;

  TaskViewModel({required TaskRepository repository})
      : _repository = repository;


  final List<Task> _tareas = [];

  final _uiid = Uuid();

  List<Task> get tareas => List.unmodifiable(_tareas);


  bool _cargando = false;

  bool get cargando => _cargando;


  Future<void> crearTarea(String titulo, String descripcion) async {
    final String id = _uiid.v4();

    final tarea = Task(
        id: id,
        titulo: titulo,
        descripcion: descripcion,
        completada: false);

    await _repository.agregarTarea(tarea);

    _tareas.add(tarea);

    notifyListeners();
  }


  Future<void> cargarTareas() async {
    try {
      _cargando = true;
      notifyListeners();

      final nuevasTareas = await _repository.obtenerTareas();

      await Future.delayed(const Duration(milliseconds: 1800));
      _tareas.clear();
      _tareas.addAll(nuevasTareas);
    } finally {
      _cargando = false;
      notifyListeners();
    }
  }

  Future<void> cambiarEstadoTarea(String id) async {
    final index = _tareas.indexWhere((t) => t.id == id);

    if (index == -1) return;

    bool nuevoEstado = !_tareas[index].completada;

    final task = await _repository.actualizarEstado(id, nuevoEstado);

    if (task != null) {
      _tareas[index] = task;
      notifyListeners();
    }
  }

}
