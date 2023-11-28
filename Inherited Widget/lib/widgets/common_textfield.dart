import 'package:flutter/material.dart';
import 'package:flutter_project/util/color_constants.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  String hint;
  String label;
  TextStyle? labelStyle;
  IconData? image;
  TextStyle hintStyle;
  bool obscureText;
  TextEditingController textEditingController;
  IconData? prefixIcon;
  Function? onChange;
  Color? errorColor;
  Color? enabledColor;

  TextFieldWidget(
      {super.key,
      required this.hint,
      required this.label,
      this.image,
      required this.hintStyle,
      this.labelStyle,
      required this.obscureText,
      required this.textEditingController,
      this.prefixIcon,
      this.onChange,
      this.errorColor,
      this.enabledColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Colors.blue,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: Colors.white,
        style: const TextStyle(fontSize: 16, color: Colors.white, height: 1.6),
        obscureText: obscureText,
        controller: textEditingController,
        decoration: InputDecoration(
          //          errorBorder:const OutlineInputBorder(
          //     borderSide: BorderSide(color: Color.fromARGB(255, 255, 0, 0), width: 0.0),
          // ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: errorColor ?? ColorConstants.whiteColor,
            ),
          ),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: enabledColor ?? ColorConstants.whiteColor)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12.5,
            vertical: 12.5,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: Icon(prefixIcon, color: Colors.white),
          filled: true,
          fillColor: Colors.blue,
        ),
        onChanged: (value) {
          if (onChange != null) {
            onChange!(value);
          }
        },
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
