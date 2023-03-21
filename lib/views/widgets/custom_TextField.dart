import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labeltext;
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.labeltext,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelText: labeltext,
            labelStyle: const TextStyle(color: Colors.blue),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
                gapPadding: 5),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 155,
                      232), // Change the border color when the field is focused
                  width: 1.0, // Change the border width
                ),
                borderRadius: BorderRadius.circular(15)),
            filled: true, // Fill the background of the field with a color
            fillColor: const Color.fromARGB(
                217, 241, 241, 241) // Change the color of the background
            ),
      ),
    );
  }
}
