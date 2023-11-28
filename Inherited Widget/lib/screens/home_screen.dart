import 'package:flutter/material.dart';
import 'package:flutter_project/screens/login_screen.dart';

import '../util/string_constants.dart';

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
        backgroundColor: Colors.blue,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context,
                    Builder(builder: (context) => const LoginScreen(data: '',)));
              },
              icon: const Icon(Icons.arrow_back_ios),color: Colors.white,)),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                StringConstants.welcomeHome,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
