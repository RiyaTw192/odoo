// timesheet_bloc.dart
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'timesheet_event.dart';
import 'timesheet_state.dart';

class TimeSheetBloc extends Bloc<TimeSheetEvent, TimeSheetState> {
  Timer? _timer;
  SharedPreferences? _prefs;

  TimeSheetBloc() : super(TimeSheetState.initial()) {

    _initializePreferences();
    // Timer events
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerTicked>(_onTicked);

    // Task events
    on<OddoList>(_onFetchTasks);
    on<OdooToggleList>(_onToggleTask);
  }

  // Initialize SharedPreferences when the BLoC is created
  Future<void> _initializePreferences() async {
    _prefs = await SharedPreferences.getInstance();
    add(OddoList());
  }

  void _onStarted(TimerStarted event, Emitter<TimeSheetState> emit) {
    emit(state.copyWith(isRunning: true));

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(TimerTicked(state.elapsedSeconds + 1));
    });

    // Save the running state and elapsed time
    _prefs?.setBool('isRunning', true);
    _prefs?.setInt('elapsedSeconds', state.elapsedSeconds);
  }

  void _onPaused(TimerPaused event, Emitter<TimeSheetState> emit) {
    _timer?.cancel();
    emit(state.copyWith(isRunning: false));

    // Save the paused state and elapsed time
    _prefs?.setBool('isRunning', false);
    _prefs?.setInt('elapsedSeconds', state.elapsedSeconds);
  }
  void _onTicked(TimerTicked event, Emitter<TimeSheetState> emit) {
    emit(state.copyWith(elapsedSeconds: event.elapsedSeconds));

    // Update the stored elapsed time
    _prefs?.setInt('elapsedSeconds', event.elapsedSeconds);
  }

  // Odoo Task-related handlers
  void _onFetchTasks(OddoList event, Emitter<TimeSheetState> emit) {
    final tasks = [
      {
        'title': "iOS app deployment",
        'subtitle': "SO056 - Booqio V2",
        'deadline': "Deadline 07/20/2023",
        'time': "00:00",
        'isRunning': false,
      },
      // {
      //   'title': "UI Design review",
      //   'subtitle': "SO057 - WebApp V1",
      //   'deadline': "Deadline 07/25/2023",
      //   'time': "00:00",
      //   'isRunning': false,
      // },
    ];

    // Retrieve previously stored state for the timer
    final isRunning = _prefs?.getBool('isRunning') ?? false;
    final elapsedSeconds = _prefs?.getInt('elapsedSeconds') ?? 0;

    emit(state.copyWith(
      isLoading: false,
      tasks: tasks,
      isRunning: isRunning,
      elapsedSeconds: elapsedSeconds,
    ));
  }

  void _onToggleTask(OdooToggleList event, Emitter<TimeSheetState> emit) {
    final updatedTasks = List<Map<String, dynamic>>.from(state.tasks);
    final task = updatedTasks[event.taskIndex];
    task['isRunning'] = !task['isRunning'];
    emit(state.copyWith(tasks: updatedTasks));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
