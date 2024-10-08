import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import '../../../src/gen/assets.gen.dart';
import 'category_item.dart';

class HomeCategoryRow extends StatelessWidget {
  const HomeCategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CategoryItem(
                icon: Assets.images.loaction.image(width: 30, height: 30),
                label: 'Xarita',
                onTap: () {
                  context.router.pushNamed('/map');
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CategoryItem(
                onTap: () {},
                icon: Assets.images.mavsum.image(width: 30, height: 30),
                label: 'Mavsum',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CategoryItem(
                onTap: () {
                  context.router.pushNamed('/recomendation');
                },
                icon: Assets.images.tavsiya.image(width: 30, height: 30),
                label: 'Tavsiya',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
