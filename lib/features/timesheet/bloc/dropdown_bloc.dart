import 'package:bloc/bloc.dart';
import 'package:oddo_fe/features/timesheet/bloc/dropdown_event.dart';
import 'package:oddo_fe/features/timesheet/bloc/dropdown_state.dart';


class DropdownBloc extends Bloc<DropDownEvent, DropdownState> {
  DropdownBloc() : super(DropdownInitial()) {
    on<ProjectSelected>((event, emit) {
      final currentState = state is DropdownLoaded ? state as DropdownLoaded : DropdownLoaded();
      emit(currentState.copyWith(selectedProject: event.selectedProject));
    });

    on<TaskSelected>((event, emit) {
      final currentState = state is DropdownLoaded ? state as DropdownLoaded : DropdownLoaded();
      emit(currentState.copyWith(selectedTask: event.selectedTask));
    });

    on<DescriptionChanged>((event, emit) {
      final currentState = state is DropdownLoaded ? state as DropdownLoaded : DropdownLoaded();
      emit(currentState.copyWith(description: event.description));
    });
    on<MakeFavourite>((event, emit) {
      final currentState = state is DropdownLoaded ? state as DropdownLoaded : DropdownLoaded();
      emit(currentState.copyWith(favourite: event.favourite));
    });
  }
}

