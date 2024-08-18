import 'package:flutter/material.dart';

abstract class ThemeDataState {}

final class ThemeDataInitial extends ThemeDataState {
  final ColorScheme colorScheme;

  ThemeDataInitial({required this.colorScheme});
}
