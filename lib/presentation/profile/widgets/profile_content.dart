import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/injection.dart';
import 'package:top_joy/presentation/profile/widgets/list_tile_profile.dart';
import 'package:top_joy/src/gen/assets.gen.dart';

class ProfileContent extends StatefulWidget {
  final Function() onTap;
  const ProfileContent({
    super.key,
    required this.onTap,
  });

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  Future<void> logOut() async {
    final sharedPreferences = getIt<SharedPreferences>();
    await sharedPreferences.setBool('isRegistor', false);

    if (context.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTileProfile(
            onTap: () {},
            title: "Mardon",
            leading: const CircleAvatar(radius: 30),
            subTitle: '+998 97 421 0412',
          ),
          const SizedBox(height: 30),
          ListTileProfile(
            onTap: () {},
            title: "Yoqtirganlar",
            leading: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(.1),
              child: Center(
                child: Assets.images.save
                    .svg(width: 20, height: 20, fit: BoxFit.cover),
              ),
            ),
          ),
          const Divider(color: AppColor.textFeildBackColor, height: 30),
          ListTileProfile(
            title: "Bog'lanish",
            leading: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(.1),
              child: Center(
                child: Assets.images.boglanish
                    .svg(width: 20, height: 20, fit: BoxFit.cover),
              ),
            ),
            onTap: () {},
          ),
          const Divider(color: AppColor.textFeildBackColor, height: 30),
          ListTileProfile(
            onTap: () {},
            title: "Til",
            leading: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(.1),
              child: Center(
                child: Assets.images.language
                    .svg(width: 20, height: 20, fit: BoxFit.cover),
              ),
            ),
          ),
          const Divider(color: AppColor.textFeildBackColor, height: 30),
          ListTileProfile(
            onTap: widget.onTap,
            title: "Chiqish",
            leading: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(.1),
              child: Center(
                child: Assets.images.logout
                    .svg(width: 20, height: 20, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
