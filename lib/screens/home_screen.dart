import 'package:flutter/material.dart';
import 'package:testrgb/utils/generate_color.dart';

/// Home screen that displays a text and changes background on tap.
class HomeScreen extends StatefulWidget {
  /// Creates a new instance of [HomeScreen].
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int _animationDurationMs = 500;
  Color _color = Colors.white;

  @override
  void initState() {
    super.initState();
    _color = GenerateColor.generateRandomColor();
  }

  void _changeColor() {
    setState(() {
      _color = GenerateColor.generateRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        ThemeData.estimateBrightnessForColor(_color) == Brightness.dark
        ? Colors.white
        : Colors.black;

    return Scaffold(
      body: GestureDetector(
        onTap: _changeColor,
        behavior: HitTestBehavior.opaque, // Ensure tap works everywhere
        child: AnimatedContainer(
          duration: const Duration(milliseconds: _animationDurationMs),
          color: _color,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello there',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
