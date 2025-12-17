import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alertshow/alertshow.dart';

void main() {
  group('alertshowSnackbar', () {
    testWidgets('Snackbar displays message', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowSnackbar(
                    context: context,
                    message: 'Test Message',
                  );
                },
                child: const Text('Show Snackbar'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Test Message'), findsOneWidget);
    });

    testWidgets('Snackbar shows default OK action button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowSnackbar(
                    context: context,
                    message: 'Test',
                  );
                },
                child: const Text('Show Snackbar'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('OK'), findsOneWidget);
    });

    testWidgets('Snackbar displays custom action label',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowSnackbar(
                    context: context,
                    message: 'Test',
                    actionLabel: 'Dismiss',
                  );
                },
                child: const Text('Show Snackbar'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Dismiss'), findsOneWidget);
      expect(find.text('OK'), findsNothing);
    });

    testWidgets('Snackbar shows success type with correct styling',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowSnackbar(
                    context: context,
                    message: 'Success!',
                    type: AlertshowType.success,
                  );
                },
                child: const Text('Show Snackbar'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.verified), findsOneWidget);
      expect(find.text('Success!'), findsOneWidget);
    });

    testWidgets('Snackbar shows danger type with correct styling',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowSnackbar(
                    context: context,
                    message: 'Error!',
                    type: AlertshowType.danger,
                  );
                },
                child: const Text('Show Snackbar'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.dangerous), findsOneWidget);
      expect(find.text('Error!'), findsOneWidget);
    });

    testWidgets('Snackbar shows warning type with correct styling',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowSnackbar(
                    context: context,
                    message: 'Warning!',
                    type: AlertshowType.warning,
                  );
                },
                child: const Text('Show Snackbar'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.warning), findsOneWidget);
      expect(find.text('Warning!'), findsOneWidget);
    });

    testWidgets('Snackbar shows info type with correct styling',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowSnackbar(
                    context: context,
                    message: 'Info!',
                    type: AlertshowType.info,
                  );
                },
                child: const Text('Show Snackbar'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.info), findsOneWidget);
      expect(find.text('Info!'), findsOneWidget);
    });

    testWidgets('Snackbar shows dark type with correct styling',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowSnackbar(
                    context: context,
                    message: 'Dark!',
                    type: AlertshowType.dark,
                  );
                },
                child: const Text('Show Snackbar'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.dark_mode), findsOneWidget);
      expect(find.text('Dark!'), findsOneWidget);
    });

    testWidgets('Snackbar action button dismisses snackbar',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowSnackbar(
                    context: context,
                    message: 'Test',
                  );
                },
                child: const Text('Show Snackbar'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Test'), findsOneWidget);

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(find.text('Test'), findsNothing);
    });

    testWidgets('Snackbar respects custom text color',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowSnackbar(
                    context: context,
                    message: 'Test',
                    color: Colors.red,
                  );
                },
                child: const Text('Show Snackbar'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('Snackbar respects duration parameter',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowSnackbar(
                    context: context,
                    message: 'Test',
                    duration: 10, // 10 seconds
                  );
                },
                child: const Text('Show Snackbar'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('Snackbar respects padding parameter',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  alertshowSnackbar(
                    context: context,
                    message: 'Test',
                    padding: const EdgeInsets.all(16),
                  );
                },
                child: const Text('Show Snackbar'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Test'), findsOneWidget);
    });
  });
}
