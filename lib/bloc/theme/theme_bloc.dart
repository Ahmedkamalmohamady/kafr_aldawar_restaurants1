import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kafr_aldawar_restaurants/shared/constants.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitialState()) {
    on<InitialThemeEvent>(initialThemeEvent);
    on<ToggleThemeEvent>(toggleThemeEvent);
  }

  FutureOr<void> initialThemeEvent(
      ThemeEvent event, Emitter<ThemeState> emit) async {

    bool light = sharedPreferences?.getBool('light') ?? true;

    light? emit(LightThemeState()) : emit(DarkThemeState());
  }

  FutureOr<void> toggleThemeEvent(
      ThemeEvent event, Emitter<ThemeState> emit) async {

    bool light = sharedPreferences?.getBool('light') ?? true;
    sharedPreferences?.setBool('light', !light);

    light? emit(DarkThemeState()) : emit(LightThemeState());
  }

}
