import 'package:flutter/material.dart';

Widget textField(TextEditingController controller, String labelText,
    String hintText, bool obscureText) {
  return Container(
    constraints: BoxConstraints(maxWidth: 300.0, maxHeight: double.infinity),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
      ),
      obscureText: obscureText,
    ),
  );
}

Widget vSpacer(double height) {
  return SizedBox(
    height: height,
  );
}
