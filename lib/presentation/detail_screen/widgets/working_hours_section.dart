import 'package:flutter/material.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';

class WorkingHoursSection extends StatelessWidget {
  final ServiceModels serviceModels;
  const WorkingHoursSection({super.key, required this.serviceModels});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              children: [
                const SizedBox(height: 5),
                Center(
                  child: Container(
                    width: 50,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.regularTextColor,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: serviceModels.workingHours?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item = serviceModels.workingHours![index];
                      return ListTile(
                        leading: Text(
                          item.day,
                          style: AppTextStyle.montserratBold
                              .copyWith(fontSize: 15, color: Colors.black),
                        ),
                        title: Text(
                          "${item.startTime} - ${item.endTime}",
                          style: AppTextStyle.montserratMedium.copyWith(
                              fontSize: 14, color: AppColor.regularTextColor),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.textFeildBackColor,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.access_time, color: AppColor.buttonColor),
                SizedBox(width: 8),
                Text(
                  'Ishlash vaqtlari',
                  style: AppTextStyle.montserratBold,
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColor.buttonColor,
            ),
          ],
        ),
      ),
    );
  }
}
