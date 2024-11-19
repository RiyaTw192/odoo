import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'theme_state.dart';

enum ThemeEvent { toggle }
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
    ThemeState(
      themeData: ThemeData.light(),
      backgroundDecoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.gradient1,
            AppColors.gradient2,
          ],
        ),
      ),
    ),
  ) {
    // Register the event handler
    on<ThemeEvent>((event, emit) {
      if (event == ThemeEvent.toggle) {
        if (state.themeData.brightness == Brightness.light) {
          emit(
            ThemeState(
              themeData: ThemeData.dark(),
              backgroundDecoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          );
        } else {
          emit(
            ThemeState(
              themeData: ThemeData.light(),
              backgroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.gradient1,
                    AppColors.gradient2,
                  ],
                ),
              ),
            ),
          );
        }
      }
    });
  }
}