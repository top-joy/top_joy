import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/injection.dart';
import 'package:top_joy/src/gen/assets.gen.dart';
import '../bloc/navigation_cubit.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isRegistered = false;

  @override
  void initState() {
    super.initState();
    _checkRegistrationStatus();
  }

  Future<void> _checkRegistrationStatus() async {
    final sharedPreferences = getIt<SharedPreferences>();
    setState(() {
      isRegistered = sharedPreferences.getBool('isRegistor') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Scaffold(
            body: context.read<NavigationCubit>().pages[state],
            bottomNavigationBar: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: BottomNavigationBar(
                currentIndex: state,
                onTap: (index) =>
                    context.read<NavigationCubit>().updateIndex(index),
                items: [
                  BottomNavigationBarItem(
                    icon: state == 0
                        ? Assets.images.homeBlue.svg()
                        : Assets.images.home.svg(),
                    label: 'Bosh sahifa',
                  ),
                  BottomNavigationBarItem(
                    icon: state == 1
                        ? Assets.images.calendarBlue.svg()
                        : Assets.images.calendar.svg(),
                    label: 'Mening yozuvlarim',
                  ),
                  BottomNavigationBarItem(
                    icon: state == 2
                        ? Assets.images.profileBlue.svg()
                        : Assets.images.profile.svg(),
                    label: 'Profil',
                  ),
                ],
                selectedItemColor: AppColor.bottomIcon,
                unselectedItemColor: Colors.black.withOpacity(0.6),
                selectedLabelStyle:
                    AppTextStyle.montserratBold.copyWith(fontSize: 11),
                unselectedLabelStyle:
                    AppTextStyle.montserratMedium.copyWith(fontSize: 11),
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
              ),
            ),
          ),
        );
      },
    );
  }
}
