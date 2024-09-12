import 'package:flutter/material.dart';
import 'package:top_joy/core/utils/app_color.dart';

class GenderOptionWidget extends StatelessWidget {
  final String option;
  final String selectedGender;
  final ValueChanged<String> onSelected;

  const GenderOptionWidget({
    super.key,
    required this.option,
    required this.selectedGender,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(option),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedGender == option
                      ? AppColor.buttonColor
                      : Colors.grey,
                  width: 2,
                ),
              ),
              child: selectedGender == option
                  ? const Center(
                      child: Icon(
                        Icons.check_circle,
                        color: AppColor.buttonColor,
                        size: 20,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              option,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
