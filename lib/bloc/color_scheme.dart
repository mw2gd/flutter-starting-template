import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

///
/// Constants
///
@immutable
class ColorSeeds {
  static const Color red = Colors.red;
  static const Color blue = Colors.blue;
  static const Color grey = Colors.blueGrey;
  static const Color green = Colors.green;
  static const Color purple = Colors.purple;
  static const Color yellow = Colors.yellow;
  static const Color teal = Colors.teal;
}

Color defaultColor = ColorSeeds.grey;

///
/// Bloc Definition
///
class ColorSchemeBloc extends Bloc<ColorSchemeEvent, ColorSchemeState> {
  ColorSchemeBloc(Brightness brightness)
      : super(ColorSchemeState(defaultColor,
            brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light)) {
    on<ColorSchemeChange>((event, emit) {
      emit(ColorSchemeState(event.newColor, state.brightness));
    });
    on<BrightnessChange>((event, emit) {
      emit(ColorSchemeState(state.color, event.newBrightness));
    });
  }
}

///
/// Bloc State
class ColorSchemeState {
  final Color color;
  final ThemeMode brightness;
  ColorSchemeState(this.color, this.brightness);
}

///
/// Bloc Event
///
@immutable
sealed class ColorSchemeEvent {}

class ColorSchemeChange extends ColorSchemeEvent {
  final Color newColor;
  ColorSchemeChange({required this.newColor});
}

class BrightnessChange extends ColorSchemeEvent {
  final ThemeMode newBrightness;
  BrightnessChange({required this.newBrightness});
}
