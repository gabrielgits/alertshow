import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alertshow/alertshow.dart';

void main() {
  group('alertshowDialog', () {
    testWidgets('Dialog displays title when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowDialog(
                    context: context,
                    title: 'Test Title',
                    content: const Text('Test Content'),
                  );
                },
                child: const Text('Show Dialog'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('Dialog displays content widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowDialog(
                    context: context,
                    content: const Text('Custom Content'),
                  );
                },
                child: const Text('Show Dialog'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Custom Content'), findsOneWidget);
    });

    testWidgets('Dialog shows default Yes button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowDialog(
                    context: context,
                    content: const Text('Test'),
                  );
                },
                child: const Text('Show Dialog'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Yes'), findsOneWidget);
    });

    testWidgets('Dialog shows default No button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowDialog(
                    context: context,
                    content: const Text('Test'),
                  );
                },
                child: const Text('Show Dialog'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('No'), findsOneWidget);
    });

    testWidgets('Dialog hides No button when noButton is null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowDialog(
                    context: context,
                    content: const Text('Test'),
                    noButton: null,
                  );
                },
                child: const Text('Show Dialog'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('No'), findsNothing);
      expect(find.text('Yes'), findsOneWidget);
    });

    testWidgets('Dialog displays custom button labels',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowDialog(
                    context: context,
                    content: const Text('Test'),
                    yesButton: 'Confirm',
                    noButton: 'Cancel',
                  );
                },
                child: const Text('Show Dialog'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Confirm'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('Dialog returns true when Yes button is pressed',
        (WidgetTester tester) async {
      bool result = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () async {
                  result = await alertshowDialog(
                    context: context,
                    content: const Text('Test'),
                  );
                },
                child: const Text('Show Dialog'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Yes'));
      await tester.pumpAndSettle();

      expect(result, true);
    });

    testWidgets('Dialog returns false when No button is pressed',
        (WidgetTester tester) async {
      bool result = true;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () async {
                  result = await alertshowDialog(
                    context: context,
                    content: const Text('Test'),
                  );
                },
                child: const Text('Show Dialog'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      await tester.tap(find.text('No'));
      await tester.pumpAndSettle();

      expect(result, false);
    });

    testWidgets('Dialog respects barrierDismissible parameter',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowDialog(
                    context: context,
                    content: const Text('Test'),
                    barrierDismissible: true,
                  );
                },
                child: const Text('Show Dialog'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);

      // Tap outside dialog should dismiss it
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets('Dialog displays Yes and No buttons with correct icons',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowDialog(
                    context: context,
                    content: const Text('Test'),
                  );
                },
                child: const Text('Show Dialog'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Check for icon buttons
      expect(find.byIcon(Icons.done), findsOneWidget); // Yes button icon
      expect(find.byIcon(Icons.cancel), findsOneWidget); // No button icon
    });
  });
}
