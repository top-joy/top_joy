import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const CustomIndicator({
    required this.currentIndex,
    required this.itemCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: currentIndex == index ? 16.0 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.blue : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}
