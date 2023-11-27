import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/util/input_validation.dart';
import 'package:flutter_project/util/string_constants.dart';
import 'package:flutter_project/widgets/common_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    debugPrint("Initial State");
  }

  @override
  void didChangeDependencies() {
    debugPrint("Dependencies changed");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    debugPrint("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  bool? isRememberMeClicked = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _message = '';
  String emailMessage = 'aaaa';
  String passwordMessage = '';
  bool? isEmailValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(
          top: 80,
          left: 40,
          right: 40,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                StringConstants.signIn,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                _message,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFieldWidget(
                textEditingController: emailController,
                obscureText: false,
                hint: "Enter your Email",
                label: "Email",
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: Icons.email,
                image: (Icons.email),
                // onChange: (val) {
                //   if (!InputValidation.isEmailValid(val)) {
                //     //setState(() {
                //       isEmailValid = false;
                //     //});
                //   } else {
                //     isEmailValid = true;
                //   }
                // },
                // validator: (email) {
                //   if (!InputValidation.isEmailValid(email)) {
                //     return "Email address should contain @";
                //   }
                //   return null;
                // },
              ),
              isEmailValid == false
                  ? Text(
                      emailMessage,
                      style: const TextStyle(color: Colors.red),
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFieldWidget(
                textEditingController: passwordController,
                obscureText: true,
                hint: "Enter your Password",
                label: "Password",
                prefixIcon: Icons.lock,
                hintStyle: const TextStyle(color: Colors.white),
                image: (Icons.lock),
                // validator: (password) {
                //   if (!InputValidation.isPasswordValid(password)) {
                //     return "Password is incorrect";
                //   }
                //   return null;
                // },
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    side: const BorderSide(color: Colors.white, width: 2),
                    value: isRememberMeClicked,
                    onChanged: (value) {
                      // print("value is $value");
                      setState(() {
                        isRememberMeClicked = value;
                      });
                    },
                  ),
                  const Text(
                    "Remember me",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 6,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    print("here");
                    if (emailController.text.toString().length == 0 &&
                        passwordController.text.toString().length == 0) {
                      setState(() {
                        isEmailValid = false;
                        print("isEmailValid is $isEmailValid");
                      });
                    }
                    //_message = "Please type correct email and password";
                    //}
                    //else {
                    // print("not checking");
                    // var email = emailController.text;
                    // _message =
                    //     "Your account with the email '$email' has been created.";
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const HomeScreen(),
                    //     ));
                    // }
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 17, 98, 163),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "- OR -",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Sign in with",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButtonWidget(imageIcon: "assets/images/facebook.png"),
                  SizedBox(
                    width: 60,
                  ),
                  ElevatedButtonWidget(imageIcon: "assets/images/google.png")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an Account ? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: null,
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
