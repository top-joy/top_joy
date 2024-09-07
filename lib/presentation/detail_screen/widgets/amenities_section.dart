import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/data/amenity/models/amenity_model.dart';

class AmenitiesSection extends StatelessWidget {
  final List<AmenityModel>? amenities;

  const AmenitiesSection({
    super.key,
    required this.amenities,
  });

  @override
  Widget build(BuildContext context) {
    if (amenities == null || amenities!.isEmpty) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Imkoniyatlar',
          style: AppTextStyle.montserratBold.copyWith(fontSize: 17),
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 5,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: amenities!.length,
          itemBuilder: (context, index) {
            final item = amenities![index];
            return Row(
              children: [
                CachedNetworkImage(
                  imageUrl: item.url!,
                  width: 20,
                  height: 20,
                  color: AppColor.regularTextColor,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.montserratMedium.copyWith(
                      color: AppColor.regularTextColor,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
