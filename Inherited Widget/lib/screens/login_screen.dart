import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/util/color_constants.dart';
import 'package:flutter_project/util/input_validation.dart';
import 'package:flutter_project/util/string_constants.dart';
import 'package:flutter_project/widgets/common_textfield.dart';
import 'package:flutter_project/widgets/inherited_widget.dart';

class LoginScreen extends StatefulWidget {
  final String? data;
  const LoginScreen({super.key, required this.data});

  @override
  State<LoginScreen> createState() {
    debugPrint(data); //to check when the create state works.
    return _LoginScreenState();
  }
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

    if (widget.data == oldWidget.data) {
      debugPrint("didUpdateWidget");
    }
  }

  bool? isRememberMeClicked = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String emailMessage = 'Please enter your Email';
  String passwordMessage = 'Please enter your Password';
  bool? isEmailValid = true;
  bool? isPasswordValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: buildBody(),
      body: MyInheritedWidget(
        message: "Kashish",
        child: Builder(builder: (BuildContext innercontext) {
          context = innercontext;
          return buildBody(context);

          // Center(
          //   child: Text(MyInheritedWidget.of(innercontext).message),
          // );
        }),
      ),
    );
  }

  Widget buildBody(BuildContext newContext) {
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
              Text(
                MyInheritedWidget.of(newContext).message,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
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
              // Text(
              //   _message,
              //   style: const TextStyle(
              //     color: Colors.red,
              //     fontSize: 16,
              //   ),
              // ),
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
                label: StringConstants.email,
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: Icons.email,
                image: (Icons.email),
                errorColor: isEmailValid == true
                    ? ColorConstants.whiteColor
                    : ColorConstants.amberColor,
                enabledColor: isEmailValid == true
                    ? ColorConstants.whiteColor
                    : ColorConstants.amberColor,
                onChange: (val) {
                  if (!InputValidation.isEmailValid(val)) {
                    setState(() {
                      isEmailValid = false;
                      debugPrint("isEmailValid in if is $isEmailValid");
                    });
                  } else {
                    setState(() {
                      isEmailValid = true;
                      debugPrint("isEmailValid in else is $isEmailValid");
                    });
                  }
                },
                // validator: (email) {
                //   if (!InputValidation.isEmailValid(email)) {
                //     return "Email address should contain @";
                //   }
                //   return null;
                // },
              ),
              const SizedBox(
                height: 10,
              ),
              isEmailValid == false
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        emailMessage,
                        style: const TextStyle(color: Colors.amber),
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  StringConstants.password,
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
                label: StringConstants.password,
                prefixIcon: Icons.lock,
                hintStyle: const TextStyle(color: Colors.white),
                image: (Icons.lock),
                enabledColor: isPasswordValid == true
                    ? ColorConstants.whiteColor
                    : ColorConstants.amberColor,
                errorColor: isPasswordValid == true
                    ? ColorConstants.whiteColor
                    : ColorConstants.amberColor,
                onChange: (val) {
                  if (!InputValidation.isPasswordValid(val)) {
                    setState(() {
                      isPasswordValid = false;
                      debugPrint("isPAsswordValid in if is $isPasswordValid");
                    });
                  } else {
                    setState(() {
                      isPasswordValid = true;
                      debugPrint(
                          "isPasssowrdValid in else is $isPasswordValid");
                    });
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              isPasswordValid == false
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        passwordMessage,
                        style: const TextStyle(color: Colors.amber),
                      ),
                    )
                  : Container(),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    StringConstants.forgotPassword,
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
                    StringConstants.rememberMe,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(newContext).size.width,
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
                    if (emailController.text.toString().isEmpty) {
                      setState(() {
                        isEmailValid = false;
                        print("isEmailValid is $isEmailValid");
                      });
                    } else if (passwordController.text.toString().isEmpty) {
                      setState(() {
                        isPasswordValid = false;
                        print("isPasswordValid is $isPasswordValid");
                      });
                    } else if (isEmailValid == true &&
                        isPasswordValid == true) {
                      Navigator.push(
                          newContext,
                          MaterialPageRoute(
                            builder: (newContext) => const HomeScreen(),
                          ));
                    }
                    //_message = "Please type correct email and password";
                    //}
                    //else {
                    // print("not checking");
                    // var email = emailController.text;
                    // _message =
                    //     "Your account with the email '$email' has been created.";

                    // }
                  },
                  child: const Text(
                    StringConstants.login,
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
                StringConstants.or,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                StringConstants.signInWith,
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
                    StringConstants.account,
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
                      StringConstants.signUp,
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
