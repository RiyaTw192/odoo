// timesheet_event.dart
abstract class TimeSheetEvent {}

// Timer Event
class TimerStarted extends TimeSheetEvent {}

class TimerPaused extends TimeSheetEvent {}

class TimerTicked extends TimeSheetEvent {}

class TimerReset extends TimeSheetEvent {}

// Task List Event
class OddoList extends TimeSheetEvent {}

class OdooToggleList extends TimeSheetEvent {
  final int taskIndex;

  OdooToggleList(this.taskIndex);

  @override
  List<Object?> get props => [taskIndex];
}
