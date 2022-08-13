// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldDefault extends StatefulWidget {
  TextEditingController controller;
  Function(String?) onChanged;
  String? Function(String?) validator;
  Widget prefixIcon;
  String hintText;
  bool obscureText;
  TextInputType inputType;
  TextInputFormatter? formatter;

  TextFieldDefault(
      {Key? key,
      this.formatter,
      required this.controller,
      required this.onChanged,
      required this.validator,
      required this.prefixIcon,
      required this.hintText,
      required this.obscureText,
      required this.inputType})
      : super(key: key);

  @override
  State<TextFieldDefault> createState() => _TextFieldDefaultState();
}

class _TextFieldDefaultState extends State<TextFieldDefault> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(color: Colors.black),
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: widget.obscureText,
      keyboardType: widget.inputType,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              // ignore: prefer_const_constructors
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              )),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              // ignore: prefer_const_constructors
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              // ignore: prefer_const_constructors
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ))),
    );
  }
}
