import 'package:coffee_shop/shared/network/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  TextEditingController controller;
  FormFieldValidator<String> validate;
  TextInputType? type;
  String? hintText;
  IconData? prefix;
  bool isPassword = false;

  DefaultTextFormField({
    super.key,
    required this.controller,
    required this.validate,
    this.type,
    this.hintText,
    this.prefix,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      validator: validate,
      cursorColor: subColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: subColor),
        prefixIcon: Icon(
          prefix,
          color: Colors.black,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
      ),
    );
  }
}
