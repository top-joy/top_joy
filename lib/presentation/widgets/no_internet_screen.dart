import 'package:flutter/material.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/src/gen/assets.gen.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Internet bilan muammo mavjud aloqani tekshirib ko'ring",
              style: AppTextStyle.montserratBold.copyWith(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            Assets.lottie.network2.lottie(),
          ],
        ),
      ),
    );
  }
}
