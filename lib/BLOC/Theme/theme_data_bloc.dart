import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:twitter2/BLOC/Theme/theme_data_event.dart';
import 'package:twitter2/BLOC/Theme/theme_data_state.dart';

class ThemeDataBloc extends Bloc<ThemeDataEvent, ThemeDataInitial> {
  ThemeDataBloc()
      : super(ThemeDataInitial(
          colorScheme: ColorScheme.light(),
        )) {
    on<ThemeChangeEvent>(
      (event, emit) => emit(ThemeDataInitial(colorScheme: event.themeData)),
    );
  }
}
