import 'package:flutter/material.dart';
import 'package:flutter_project/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    debugPrint("Initial State");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context,
                    Builder(builder: (context) => const LoginScreen()));
              },
              icon: const Icon(Icons.arrow_back_ios))),
      body: const Center(
        child: Column(
          children: [
            Text("HomeScreen"),
            Text(""),
          ],
        ),
      ),
    );
  }
}
