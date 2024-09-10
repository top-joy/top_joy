import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/presentation/profile/widgets/list_tile_profile.dart';
import 'package:top_joy/src/gen/assets.gen.dart';
import '../bloc/user_profile_bloc.dart';

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
    context.read<UserProfileBloc>().add(FetchUser());
    context.read<UserProfileBloc>().add(LoadUserProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<UserProfileBloc, UserProfileState>(
        bloc: context.read<UserProfileBloc>()..add(FetchUser()),
        builder: (context, state) {
          if (state is UserProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserProfileLoaded) {
            final userModel = state.userModel;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTileProfile(
                  onTap: () {},
                  title: userModel.firstName,
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: userModel.photo.isNotEmpty
                        ? NetworkImage(userModel.photo)
                        : null,
                    child: userModel.photo.isEmpty
                        ? const Icon(Icons.person, size: 30)
                        : null,
                  ),
                  subTitle: userModel.phoneNumber,
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
            );
          } else if (state is UserProfileError) {
            context.read<UserProfileBloc>().add(FetchUser());
            context.read<UserProfileBloc>().add(LoadUserProfile());
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
