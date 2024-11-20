abstract class DropDownEvent {}

class ProjectSelected extends DropDownEvent {
  final String selectedProject;

  ProjectSelected(this.selectedProject);

}
class TaskSelected extends DropDownEvent {
  final String selectedTask;

  TaskSelected(this.selectedTask);
}
class DescriptionChanged extends DropDownEvent {
  final String description;

  DescriptionChanged(this.description);
}

class MakeFavourite extends DropDownEvent {
  final String favourite;

  MakeFavourite(this.favourite);
}