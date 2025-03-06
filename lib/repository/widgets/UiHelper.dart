import 'package:flutter/material.dart';

class Uihelper {
  static CustomImage({required String image, double? height, double? width}) {
    return Image.asset("assets/logos/$image"
    , height: height, width: width,);

  }

  //Custom Text
  static Widget customText(String text, { 
    double fontSize = 14, 
    FontWeight fontWeight = FontWeight.normal, 
    Color color = Colors.black 
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }


  //Custom Textbox
  static Widget CustomTextBox({required String label, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    );
  }
}