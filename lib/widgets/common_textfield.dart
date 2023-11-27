import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  String hint;
  String label;
  TextStyle? labelStyle;
  IconData? image;
  TextStyle hintStyle;
  bool obscureText;
  FormFieldValidator? validator;
  TextEditingController textEditingController;
  IconData? prefixIcon;
  Function? onChange;

  TextFieldWidget({
    super.key,
    required this.hint,
    required this.label,
    this.image,
    required this.hintStyle,
    this.labelStyle,
    this.validator,
    required this.obscureText,
    required this.textEditingController,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Colors.blue,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        cursorColor: Colors.white,
        style: const TextStyle(fontSize: 16, color: Colors.white, height: 1.6),
        obscureText: obscureText,
        controller: textEditingController,
        decoration: InputDecoration(
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12.5,
            vertical: 12.5,
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: Icon(prefixIcon, color: Colors.white),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              )),
          filled: true,
          fillColor: Colors.blue,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
        // onChanged: (value) {
        //   if (onChange != null) {
        //     onChange();
        //   }
        // },
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
