import 'package:flutter/material.dart';

import 'alertshow_type.dart';

void alertshowSnackbar({
  required BuildContext context,
  required String message,
  final Color color = Colors.white,
  final AlertshowType type = AlertshowType.success,
  final int duration = 3,
  final EdgeInsetsGeometry? padding,
}) {
  Color? backgroundColor;
  IconData? icon;
  switch (type) {
    case AlertshowType.success:
      backgroundColor = Colors.green;
      icon = Icons.verified;
      break;
    case AlertshowType.danger:
      backgroundColor = Colors.red;
      icon = Icons.dangerous;
      break;
    case AlertshowType.warning:
      backgroundColor = Colors.orange;
      icon = Icons.warning;
      break;
    case AlertshowType.info:
      backgroundColor = Colors.blue;
      icon = Icons.info;
      break;
    default:
      backgroundColor = Colors.black;
      icon = Icons.dark_mode;
      break;
  }

  final snackBar = SnackBar(
    content: CustomSnackBar(
      message: message,
      backgroundColor: backgroundColor,
      textColor: color,
      icon: icon,
    ),
    duration: Duration(seconds: duration),
    backgroundColor: backgroundColor,
    padding: padding,
    action: SnackBarAction(
      label: 'OK',
      textColor: color,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class CustomSnackBar extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;

  const CustomSnackBar({
    super.key,
    required this.message,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      //direction: Axis.vertical,
      children: <Widget>[
        Icon(
          icon,
          color: textColor,
        ),
        const SizedBox(width: 10),
        Text(
          message,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ],
    );
  }
}
