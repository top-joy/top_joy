import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:top_joy/core/navigation/app_router.gr.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/data/user/models/user_model.dart';
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
  @override
  void initState() {
    super.initState();
    // Initialize the Hive box if needed
    getIt<Box<UserModel>>().listenable().addListener(_updateUser);
  }

  @override
  void dispose() {
    // Remove the listener when the widget is disposed
    getIt<Box<UserModel>>().listenable().removeListener(_updateUser);
    super.dispose();
  }

  void _updateUser() {
    // Check if the widget is still mounted before calling setState
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ValueListenableBuilder(
        valueListenable: getIt<Box<UserModel>>().listenable(),
        builder: (context, Box<UserModel> box, child) {
          final userModel = box.get('user');

          if (userModel == null) {
            return const Center(child: Text('No user data available'));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTileProfile(
                onTap: () {
                  context.router.push(UserInfoRoute(userModel: userModel));
                },
                title: userModel.firstName,
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: userModel.photo.isNotEmpty
                      ? NetworkImage(userModel.photo)
                      : null,
                  child: userModel.photo.isEmpty
                      ? Assets.images.person.image()
                      : null,
                ),
                subTitle: userModel.phoneNumber,
              ),
              const SizedBox(height: 30),
              ListTileProfile(
                onTap: () {
                  context.router.pushNamed('/favorite');
                },
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
          );
        },
      ),
    );
  }
}
