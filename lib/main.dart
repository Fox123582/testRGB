import 'package:flutter/material.dart';
import 'package:testrgb/screens/home_screen.dart';

void main() {
  runApp(const Main());
}

/// The main entry point of the application.
class Main extends StatelessWidget {
  /// Creates a new instance of [Main].
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}
