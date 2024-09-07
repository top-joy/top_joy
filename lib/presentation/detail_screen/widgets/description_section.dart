import 'package:flutter/material.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';

class DescriptionSection extends StatefulWidget {
  final String description;

  const DescriptionSection({
    super.key,
    required this.description,
  });

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tavsif', style: AppTextStyle.montserratBold.copyWith(fontSize: 17)),
        const SizedBox(height: 8),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: Text(
            _isExpanded
                ? widget.description
                : widget.description.substring(
                    0,
                    widget.description.length > 150
                        ? 150
                        : widget.description.length),
            style: AppTextStyle.montserratMedium.copyWith(
              color: AppColor.regularTextColor,
            ),
            maxLines: _isExpanded ? null : 3,
            overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 8),
        if (widget.description.length > 150)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              children: [
                Text(
                  _isExpanded ? "Yopish" : "Hammasini o'qing",
                  style: AppTextStyle.montserratMedium.copyWith(
                      color: AppColor.buttonColor),
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up_sharp
                      : Icons.keyboard_arrow_down_sharp,
                  color: AppColor.buttonColor,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
