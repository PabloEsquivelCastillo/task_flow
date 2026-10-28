import 'package:flutter/material.dart';
import 'package:task_flow/features/tasks/domain/entities/task.dart';
import 'package:task_flow/features/tasks/domain/repositories/task_repository.dart';



class TaskViewModel extends ChangeNotifier {

  final TaskRepository _repository;

  TaskViewModel({required TaskRepository repository})
      : _repository = repository;



  final List<Task> _tareas = [];
  List<Task> get tareas => List.unmodifiable(_tareas);

  bool _cargando = false;
  bool get cargando => _cargando;

  Future<void> cargarTareas() async {
      try {
        _cargando = true;
        notifyListeners();
        final nuevasTareas = await _repository.obtenerTareas();

        _tareas.clear();
        _tareas.addAll(nuevasTareas);

      } finally {
        _cargando = false;
        notifyListeners();

      }
  }
}