import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavState(selectedIndex: 0));

  static BottomNavCubit get(context) => BlocProvider.of(context);

  void changeTab(int index) {
    emit(BottomNavState(selectedIndex: index));
  }
}
