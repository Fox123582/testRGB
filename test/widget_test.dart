import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testrgb/main.dart';

void main() {
  testWidgets(
      'Initial screen displays "Hello there" and changes background on tap',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Main());

    // 1. Verify that 'Hello there' is displayed in the center.
    final textFinder = find.text('Hello there');
    expect(textFinder, findsOneWidget);

    // Verify it is centered (at least it's in a Center widget).
    final centerFinder =
        find.ancestor(of: textFinder, matching: find.byType(Center));
    expect(centerFinder, findsOneWidget);

    // 2. Verify that tapping on the screen changes the background color.

    // Find the AnimatedContainer which manages the background color.
    final animatedContainerFinder = find.byType(AnimatedContainer);
    expect(animatedContainerFinder, findsOneWidget);

    // Get the initial color.
    final initialContainer =
        tester.widget<AnimatedContainer>(animatedContainerFinder);
    final initialColor = (initialContainer.decoration as BoxDecoration?)?.color;

    // Tap on the container (which is inside a GestureDetector).
    await tester.tap(animatedContainerFinder);

    // We need to wait for the animation to finish.
    // The duration is 500ms in home_screen.dart.
    await tester.pumpAndSettle();

    // Get the new color.
    final newContainer =
        tester.widget<AnimatedContainer>(animatedContainerFinder);
    final newColor = (newContainer.decoration as BoxDecoration?)?.color;

    // Verify the color has changed.
    expect(newColor, isNot(initialColor),
        reason: 'Color should change after a tap.');
  });
}
