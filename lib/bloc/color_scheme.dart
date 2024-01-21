import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

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

///
/// Bloc Definition
///
class ColorSchemeBloc extends Bloc<ColorSchemeEvent, ColorSchemeState> {
  ColorSchemeBloc()
      : super(ColorSchemeState(ColorSeeds.grey, ThemeMode.system)) {
    on<ColorSchemeChange>((event, emit) {
      emit(ColorSchemeState(event.changeTo, state.brightness));
    });
    on<BrightnessChange>((event, emit) {
      emit(ColorSchemeState(state.color, event.changeTo));
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
  final Color changeTo;
  ColorSchemeChange({required this.changeTo});
}

class BrightnessChange extends ColorSchemeEvent {
  final ThemeMode changeTo;
  BrightnessChange({required this.changeTo});
}
