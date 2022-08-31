import 'package:flutter/material.dart';
class TextFeild extends StatelessWidget {
  String title;
  Icon? icon;
  TextEditingController controller;
  TextInputType? keyboardType;
  FormFieldValidator<String>? validator;
  TextFeild({required this.title, this.icon,required this.controller, this.keyboardType,this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffC6C6C6)),
          borderRadius: BorderRadius.circular(10)
      ),
      height: 40,
      child: TextFormField(
validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),

          suffixIcon: icon,
            hintText: title,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none
        ),
      ),
    );
  }
}

