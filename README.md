# TaskFlow

Aplicación móvil desarrollada con **Flutter** para la gestión básica de tareas. Este proyecto tiene como objetivo practicar el desarrollo de aplicaciones utilizando arquitectura MVVM, gestión de estado con Provider y el patrón Repository.

## Versión 1.0 — CRUD básico

<details>
<summary>Estado de la versión</summary>

- [x] Crear tareas.
- [x] Consultar y visualizar tareas.
- [x] Editar tareas existentes.
- [x] Cambiar el estado de una tarea.
- [x] Eliminar tareas con confirmación.
- [x] Validar que el título no esté vacío.
- [x] Separar responsabilidades mediante MVVM.
- [x] Implementar Repository con almacenamiento en memoria.

</details>

## Tecnologías utilizadas

- **Flutter:** desarrollo de la interfaz móvil.
- **Dart:** lenguaje de programación.
- **Provider:** gestión de estado.
- **ChangeNotifier:** notificación de cambios en el estado.
- **UUID:** generación de identificadores únicos.
- **Material Design:** componentes visuales.

## Arquitectura

El proyecto utiliza una separación de responsabilidades basada en MVVM y Repository.

```text
lib/
└── features/
    └── tasks/
        ├── domain/
        │   ├── entities/
        │   │   └── task.dart
        │   └── repositories/
        │       └── task_repository.dart
        │
        ├── data/
        │   └── repositories/
        │       └── memory_task_repository.dart
        │
        └── presentation/
            ├── viewmodels/
            │   └── task_viewmodel.dart
            └── views/
                └── task_list_view.dart
```

### Responsabilidades

| Componente | Responsabilidad |
|---|---|
| Entity | Representa una tarea mediante sus atributos. |
| Repository | Define el contrato para las operaciones de datos. |
| MemoryTaskRepository | Implementa el almacenamiento temporal en memoria. |
| TaskViewModel | Gestiona el estado y coordina las operaciones. |
| TaskListView | Presenta las tareas y recibe las interacciones del usuario. |

## Funcionalidades

### Gestión de tareas

Cada tarea contiene:

- `id`: identificador único.
- `titulo`: nombre de la tarea.
- `descripcion`: información adicional.
- `completada`: estado de finalización.

### Operaciones CRUD

| Operación | Descripción |
|---|---|
| Create | Registrar nuevas tareas. |
| Read | Consultar y visualizar las tareas. |
| Update | Modificar título, descripción y estado. |
| Delete | Eliminar tareas mediante una confirmación. |

## Almacenamiento de datos

En esta versión se utiliza `MemoryTaskRepository`, que almacena las tareas en una lista dentro de la memoria de la aplicación.

**Limitación:** los cambios realizados no son permanentes. Al cerrar o reiniciar la aplicación, las tareas creadas, editadas o eliminadas se pierden y se recuperan los datos iniciales definidos en el repositorio.

En futuras versiones se contempla implementar persistencia mediante una base de datos local.

## Instalación y ejecución

### Requisitos

- Flutter SDK.
- Dart SDK.
- Android Studio o Visual Studio Code.
- Emulador Android o dispositivo físico.

### Pasos

1. Clonar el repositorio:

```bash
git clone <URL_DEL_REPOSITORIO>
```

2. Acceder al proyecto:

```bash
cd task_flow
```

3. Instalar dependencias:

```bash
flutter pub get
```

4. Ejecutar la aplicación:

```bash
flutter run
```

## Objetivo de aprendizaje

TaskFlow es un proyecto de aprendizaje incremental enfocado en comprender:

- Arquitectura MVVM.
- Gestión de estado con Provider y ChangeNotifier.
- Separación entre interfaz y lógica de negocio.
- Patrón Repository.
- Programación asíncrona con Future y async/await.
- Inmutabilidad de entidades.
- Operaciones CRUD.
- Validación de formularios y controladores de texto.

## Próximas mejoras

- [ ] Implementar persistencia local con SQLite.
- [ ] Incorporar manejo de errores.
- [ ] Mejorar los estados de carga.
- [ ] Agregar pruebas unitarias para ViewModel y Repository.
- [ ] Mejorar la interfaz y experiencia de usuario.
- [ ] Implementar filtros de tareas completadas y pendientes.

---

**TaskFlow v1.0 — CRUD básico con almacenamiento en memoria.**

Proyecto desarrollado con fines educativos para fortalecer conocimientos de Flutter y arquitectura de aplicaciones móviles.