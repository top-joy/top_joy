import 'package:flutter/material.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';

class ListTileProfile extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Widget leading;
  final String? subTitle;
  const ListTileProfile({
    super.key,
    this.subTitle,
    required this.title,
    required this.leading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Row(
          children: [
            leading,
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.montserratBold.copyWith(fontSize: 18),
                ),
                if (subTitle != null)
                  Text(
                    subTitle ?? '',
                    style: AppTextStyle.montserratMedium.copyWith(
                        color: AppColor.regularTextColor, fontSize: 15),
                  ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right_rounded),
          ],
        ),
      ),
    );
  }
}
