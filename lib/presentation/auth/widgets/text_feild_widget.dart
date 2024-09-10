import 'package:flutter/material.dart';
import 'package:top_joy/core/utils/app_color.dart';

class TextFeildWidget extends StatelessWidget {
  const TextFeildWidget({
    super.key,
    required this.controller,
    required this.label,
    this.onTap,
    required this.hintText,
  });

  final String label;
  final Function()? onTap;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          onTap: onTap,
          readOnly: onTap != null,  // If onTap is provided, make the field read-only
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.textFeildBackColor,
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
