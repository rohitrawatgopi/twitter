import 'package:flutter/material.dart';

abstract class ThemeDataEvent {}

class ThemeChangeEvent extends ThemeDataEvent {
  final ColorScheme themeData;

  ThemeChangeEvent({required this.themeData});
}
