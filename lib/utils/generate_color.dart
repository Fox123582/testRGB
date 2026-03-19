import 'dart:math';
import 'package:flutter/material.dart';

/// Utility class to generate random colors.
abstract final class GenerateColor {
  static const int _maxColorValue = 256;
  static const int _opaqueAlpha = 255;

  /// Generates a random color with full opacity.
  static Color generateRandomColor() {
    final random = Random();

    return Color.fromARGB(
      _opaqueAlpha,
      random.nextInt(_maxColorValue),
      random.nextInt(_maxColorValue),
      random.nextInt(_maxColorValue),
    );
  }
}
