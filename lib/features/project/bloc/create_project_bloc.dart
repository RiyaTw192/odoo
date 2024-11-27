import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_project_event.dart';
import 'create_project_state.dart';

class CreateProjectBloc extends Bloc<CreateProjectEvent, CreateProjectState> {
  CreateProjectBloc() : super(const CreateProjectState()) {
    on<SelectColorEvent>((event, emit) {
      emit(state.copyWith(selectedColor: event.selectedColor));
    });

    on<ToggleFavoriteEvent>((event, emit) {
      emit(state.copyWith(isFavorite: event.isFavorite));
    });
  }
}
