import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/src/gen/assets.gen.dart';
import '../../../core/navigation/app_router.gr.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../data/service_data/models/service_models.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModels service;

  const ServiceCard({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          DetailRoute(serviceModels: service),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 3.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12.0),
                  bottom: Radius.circular(12),
                ),
                child: CachedNetworkImage(
                  imageUrl: service.url[0].url,
                  placeholder: (context, url) => _buildShimmerImage(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error_rounded,
                    color: Colors.red,
                  ),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 180.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.name,
                    style: AppTextStyle.montserratBold.copyWith(fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Assets.images.location.svg(),
                      const SizedBox(width: 4.0),
                      Flexible(
                        child: Text(
                          service.address,
                          style: AppTextStyle.montserratRegular.copyWith(
                            color: AppColor.regularTextColor,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      Assets.images.navigator.svg(),
                      const SizedBox(width: 4.0),
                      Text(
                        '${service.distance} km uzoqlikda',
                        style: AppTextStyle.montserratRegular.copyWith(
                          color: AppColor.regularTextColor,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerImage() {
    return Container(
      width: double.infinity,
      height: 180.0,
      color: Colors.grey[300],
    );
  }
}
