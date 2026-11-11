import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/main.dart'; // ← use YOUR actual package name

void main() {
  testWidgets('App renders home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const VideoNotesApp());

    // Home screen headline
    expect(find.text('Turn videos into notes'), findsOneWidget);

    // Primary CTA button
    expect(find.text('Convert a video'), findsOneWidget);
  });

  testWidgets('Bottom navigation switches to Saved notes',
          (WidgetTester tester) async {
        await tester.pumpWidget(const VideoNotesApp());

        // Tap "Saved notes" tab
        await tester.tap(find.text('Saved notes').last);
        await tester.pumpAndSettle();

        // Saved notes screen heading should now be visible
        expect(find.textContaining('notes ready to review'), findsOneWidget);
      });

  testWidgets('Tapping Convert a video opens AddVideoScreen',
          (WidgetTester tester) async {
        await tester.pumpWidget(const VideoNotesApp());

        await tester.tap(find.text('Convert a video'));
        await tester.pumpAndSettle();

        // AddVideoScreen heading
        expect(find.text('Add video'), findsOneWidget);
      });
}