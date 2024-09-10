import 'package:flutter/material.dart';

import '../../../core/utils/app_text_style.dart';
import '../../../src/gen/assets.gen.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      titleSpacing: 10,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Futbol o'ynashni rejalashtiryapsizmi",
            style: AppTextStyle.montserratBold.copyWith(fontSize: 16),
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Assets.images.notification.svg(),
        ),
      ],
    );
  }
}
