import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/inherited_widget.dart';

class InheritedScreen extends StatelessWidget {
  const InheritedScreen({super.key, required String data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyInheritedWidget(
        message: "We are in the inherited widget",
        child: Builder(
          builder: (BuildContext innercontext){
            return Center(
              child: Text(MyInheritedWidget.of(innercontext).message),
            );
          }
        ),
      ),
    );
  }
}
