// timesheet_state.dart
class TimeSheetState {
  //timer related - properties
  final int elapsedSeconds;
  final bool isRunning;

  // Task-related properties
  final bool isLoading;
  final List<Map<String, dynamic>> tasks;

  TimeSheetState({
    required this.elapsedSeconds,
    required this.isRunning,
    required this.isLoading,
    required this.tasks,
  });

  // Initial state for timer, oddo List
  factory TimeSheetState.initial() {
    return TimeSheetState(
        elapsedSeconds: 0,
        isRunning: false,
        isLoading: true,
        tasks: [],
    );
  }

  // Copying the state to create new instances with modified values
  TimeSheetState copyWith({int? elapsedSeconds, bool? isRunning, bool? isLoading, List<Map<String, dynamic>>? tasks}) {
    return TimeSheetState(
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      isRunning: isRunning ?? this.isRunning,
      isLoading: isLoading ?? this.isLoading,
      tasks: tasks ?? this.tasks,
    );
  }
  @override
  List<Object?> get props => [elapsedSeconds, isRunning, isLoading, tasks];
}
