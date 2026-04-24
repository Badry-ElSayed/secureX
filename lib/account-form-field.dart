import 'package:flutter/material.dart';

class AccountFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  const AccountFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Color(0xFFEDE6D8)),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Color(0xFFEDE6D8)),
        prefixIcon: Icon(icon, color: Color(0xFFEDE6D8)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFEDE6D8)),
        ),
      ),
    );
  }
}
