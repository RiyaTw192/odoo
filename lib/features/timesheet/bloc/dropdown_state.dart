abstract class DropdownState {}

class DropdownInitial extends DropdownState {}

class DropdownLoaded extends DropdownState {
  final String? selectedProject;
  final String? selectedTask;
  final String description;
  final String? favourite;

  DropdownLoaded({
    this.selectedProject,
    this.selectedTask,
    this.description = '',
    this.favourite,
  });

  DropdownLoaded copyWith({
    String? selectedProject,
    String? selectedTask,
    String? description,
    String? favourite
  }) {
    return DropdownLoaded(
      selectedProject: selectedProject ?? this.selectedProject,
      selectedTask: selectedTask ?? this.selectedTask,
      description: description ?? this.description,
      favourite: favourite ?? this.favourite
    );
  }
}

