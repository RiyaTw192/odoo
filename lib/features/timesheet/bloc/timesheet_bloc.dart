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

    // Timer events
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerTicked>(_onTicked);
    on<TimerReset>(_onReset);
    _loadElapsedSeconds();

    // Task events
    on<OddoList>(_onFetchTasks);
    on<OdooToggleList>(_onToggleTask);
  }

  Future<void> _loadElapsedSeconds() async {
    final prefs = await SharedPreferences.getInstance();
    final elapsed = prefs.getInt('elapsedSeconds') ?? 0;
    emit(state.copyWith(elapsedSeconds: elapsed));
  }

  Future<void> _saveElapsedSeconds(int seconds) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('elapsedSeconds', seconds);
  }

  void _onStarted(TimerStarted event, Emitter<TimeSheetState> emit) {
    emit(state.copyWith(isRunning: true));
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(TimerTicked());
    });
  }

  void _onPaused(TimerPaused event, Emitter<TimeSheetState> emit) {
    _timer?.cancel();
    emit(state.copyWith(isRunning: false));
  }

  void _onReset(TimerReset event, Emitter<TimeSheetState> emit) async {
    _timer?.cancel();
    await _saveElapsedSeconds(0);
    emit(TimeSheetState.initial());
  }

  void _onTicked(TimerTicked event, Emitter<TimeSheetState> emit) {
    final newElapsed = state.elapsedSeconds + 1;
    _saveElapsedSeconds(newElapsed);
    emit(state.copyWith(elapsedSeconds: newElapsed));
  }

  // Odoo Task-related handlers
  void _onFetchTasks(OddoList event, Emitter<TimeSheetState> emit) {
    final tasks = [
      {
        'title': "iOS app deployme nt",
        'subtitle': "SO056 - Booqio V2",
        'deadline': "Deadline 07/20/2023",
        'time': "00:00",
        'isRunning': false,
      },



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
