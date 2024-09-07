import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';
import 'package:top_joy/presentation/detail_screen/widgets/detail_app_bar_button.dart';

class DetailAppBar extends StatelessWidget {
  final ServiceModels serviceModels;
  const DetailAppBar({super.key, required this.serviceModels});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceMaterialTransparency: true,
      pinned: false,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: serviceModels.url[0].url,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ],
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(7.0),
        child: DetailAppBarButton(
          icon: Icons.arrow_back_ios_rounded,
          onPressed: () {
            context.router.maybePop();
          },
        ),
      ),
      actions: [
        DetailAppBarButton(icon: Icons.share, onPressed: () {}),
        const SizedBox(width: 15),
        DetailAppBarButton(icon: Icons.favorite_border_rounded, onPressed: () {}),
        const SizedBox(width: 10),
      ],
    );
  }
}
