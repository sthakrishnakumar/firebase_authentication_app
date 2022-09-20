import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void snackbar(BuildContext context, String title,
    {Color color = Colors.black}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
      backgroundColor: color,
    ),
  );
}

void navigation(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => widget),
  );
}

void pushNavigation(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
    context,
    CupertinoPageRoute(builder: (context) => widget),
  );
}
