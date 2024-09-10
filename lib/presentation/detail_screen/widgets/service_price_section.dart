import 'package:flutter/material.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';
import 'package:top_joy/presentation/detail_screen/widgets/format_sum.dart';

class ServicePriceSection extends StatelessWidget {
  final ServiceModels serviceModels;

  const ServicePriceSection({
    super.key,
    required this.serviceModels,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${formatCurrency(serviceModels.price)} So'm",
          style: AppTextStyle.montserratBold.copyWith(fontSize: 15),
        ),
        const Text(
          "Soatiga",
          style: AppTextStyle.montserratMedium,
        ),
      ],
    );
  }
}
