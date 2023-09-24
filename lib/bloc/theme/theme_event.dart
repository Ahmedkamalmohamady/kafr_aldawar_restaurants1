part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class InitialThemeEvent extends ThemeEvent{}

class ToggleThemeEvent extends ThemeEvent{}
