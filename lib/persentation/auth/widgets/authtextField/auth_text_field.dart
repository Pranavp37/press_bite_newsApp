import 'package:flutter/material.dart';
import 'package:news_app/common/helper/is_dark_mode.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPassword!,
      decoration: InputDecoration(
          label: Text(label),
          labelStyle: TextStyle(
              color: context.isDarkMode ? Colors.white : Colors.black,
              fontSize: 18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
