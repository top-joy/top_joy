import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_joy/core/navigation/app_router.gr.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';
import 'package:top_joy/presentation/detail_screen/widgets/format_sum.dart';

class DetailBottomBar extends StatelessWidget {
  final ServiceModels serviceModels;
  const DetailBottomBar({super.key, required this.serviceModels});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      shadowColor: Colors.black,
      color: Colors.white,
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "${formatCurrency(serviceModels.price)} So'm",
                  style: AppTextStyle.montserratBold.copyWith(fontSize: 16),
                ),
              ),
              const Expanded(
                child: Text(
                  "Soatiga",
                  style: AppTextStyle.montserratMedium,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              context.router.push(FreeTimesRoute(serviceId: serviceModels.id));
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
              backgroundColor: AppColor.buttonColor,
            ),
            child: Center(
              child: Text(
                "Bron qilish",
                style:
                    AppTextStyle.montserratBold.copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
