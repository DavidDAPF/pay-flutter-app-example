import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String text) onChanged;
  // final String Function(String? text)? validator;
  final String? Function(String?)? validator;

  const InputText({
    super.key,
    this.label = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
