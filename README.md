## alertshow

Flutter package to show diferents types of alert message.


## Features

- AlertshowDialog
- AlertshowSnackBar


## Getting started

2. To use this package, add expt as dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  alertshow:
    git: https://github.com/gabrielgits/alertshow.git
```

3. Import the package into your dart file:

```dart
import 'package:alertshow/alertshow.dart';
```

## Usage

```dart

      Center(
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
                final confirmation = await alertshowDialog(
                    context: context,
                    title: title,
                    yesButton: 'Yes',
                    noButton: 'No',
                    content: const Text(
                        'This is a message from alertshow dialog. Please press a button:'));
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
              },
            )
          ],
        ),
      ),

```