// timesheet_event.dart
abstract class TimeSheetEvent {}

// Timer Event
class TimerStarted extends TimeSheetEvent {}

class TimerPaused extends TimeSheetEvent {}

class TimerTicked extends TimeSheetEvent {
  final int elapsedSeconds;

  TimerTicked(this.elapsedSeconds);
}

// Task List Event
class OddoList extends TimeSheetEvent {}

// class ToggleTask extends TimeSheetEvent {
//   final int taskIndex;
//
//   ToggleTask(this.taskIndex);
// }

class OdooToggleList extends TimeSheetEvent {
  final int taskIndex;

  OdooToggleList(this.taskIndex);

  @override
  List<Object?> get props => [taskIndex];
}

