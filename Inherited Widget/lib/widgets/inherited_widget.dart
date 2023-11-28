import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  @override
  const MyInheritedWidget(
      {Key? key, required this.child, required this.message})
      : super(
          key: key,
          child: child,
        );
  final Widget child;
  final String message;

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.message != message;
  }
}