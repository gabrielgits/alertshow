import 'package:flutter/material.dart';
import 'package:alertshow/alertshow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const title = 'Alert Show Demo';
    return const MaterialApp(
      title: title,
      home: HomePage(title: title),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: const Text('Show SnackBar'),
              onPressed: () {
                alertshowSnackbar(
                  context: context,
                  message: 'This is a message from alertshow snackbar',
                  type: AlertshowType.info,
                  duration: 5,
                );
              },
            ),
            ElevatedButton(
              child: const Text('Show Dialog'),
              onPressed: () async {
                await alertshowDialog(
                    context: context,
                    title: title,
                    yesButton: 'Yes',
                    noButton: 'No',
                    content: const SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          Text(
                              'This is a message from alertshow dialog. Please press a button:'),
                          SizedBox(height: 20),
                          Text(
                              'Depending on the button pressed, the message will change'),
                        ],
                      ),
                    )).then((confirmation) {
                  if (confirmation) {
                    alertshowSnackbar(
                      context: context,
                      message: 'Yes was pressed',
                    );
                    return;
                  }
                  alertshowSnackbar(
                    context: context,
                    message: 'No was pressed',
                    type: AlertshowType.danger,
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
