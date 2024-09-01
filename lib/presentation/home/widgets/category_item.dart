import 'package:flutter/material.dart';
import 'package:top_joy/core/utils/app_text_style.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Function() onTap;
  final Image icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(height: 8),
            Text(
              label,
              style: AppTextStyle.montserratBold,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
