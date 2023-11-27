import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  String hint;
  String label;
  TextStyle? labelStyle;
  IconData? image;
  TextStyle hintStyle;
  bool obscureText;
  FormFieldValidator validator;
  TextEditingController textEditingController;

  TextFieldWidget({
    super.key,
    required this.hint,
    required this.label,
    this.image,
    required this.hintStyle,
    this.labelStyle,
    required this.validator,
    required this.obscureText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      // Container(
      //   margin: const EdgeInsets.only(bottom: 25),
      //   padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
      //   // decoration: const BoxDecoration(
      //   color: Colors.blue,
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Color.fromARGB(255, 30, 136, 223),
      //       offset: Offset(0, 4),
      //       spreadRadius: 2,
      //       blurRadius: 4,
      //     ),
      //   ],
      // ),
      color: Colors.blue,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      shadowColor: const Color.fromARGB(255, 30, 136, 223),
      elevation: 4,
      
      child: TextFormField(
        controller: textEditingController,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          error: DecoratedBox(decoration: BoxDecoration()),
          fillColor: Colors.blue,
          filled: true,
          border: InputBorder.none,
          iconColor: Colors.white,
          icon: Icon(image ?? Icons.abc),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color.fromARGB(136, 255, 255, 255),
          ),
        ),
        validator: validator,
        obscureText: obscureText,
      ),
    );
  }
}

class ElevatedButtonWidget extends StatelessWidget {
  final String imageIcon;
  const ElevatedButtonWidget({super.key, required this.imageIcon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 5,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      child: Image.asset(imageIcon, height: 30, width: 30),
    );
  }
}
