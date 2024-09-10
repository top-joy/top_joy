import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/data/user/models/user_model.dart';
import 'package:top_joy/injection.dart';
import 'package:top_joy/presentation/profile/widgets/profile_content.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  Future<void> _logOut() async {
    bool shouldLogOut = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Center(
          child: Text(
            'Chiqish',
            style: AppTextStyle.montserratBold,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: const Text('Chiqmoqchimisiz?', textAlign: TextAlign.center),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColor.textFeildBackColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              Navigator.of(context).pop(false); // Yo'q tugmasi bosildi
            },
            child: Text(
              "Yo'q",
              style:
                  AppTextStyle.montserratMedium.copyWith(color: Colors.black),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColor.buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              Navigator.of(context).pop(true); // Ha tugmasi bosildi
            },
            child: Text(
              'Ha',
              style:
                  AppTextStyle.montserratMedium.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );

    // Agar foydalanuvchi chiqishni tasdiqlasa
    if (shouldLogOut == true) {
      getIt<Box<UserModel>>().clear();
      final sharedPreferences = getIt<SharedPreferences>();
      await sharedPreferences.setBool(
          'isRegistor', false); // isRegistor holatini o'zgartirish
      setState(() {
        isRegistered = false; // UI ni yangilash
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: AppTextStyle.montserratBold,
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: isRegistered
            ? ProfileContent(
                onTap: _logOut,
              )
            : _buildRegistrationPrompt(),
      ),
    );
  }

  Widget _buildRegistrationPrompt() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadowColor: Colors.blue.withOpacity(0.4),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.blue[300]!, Colors.blue[700]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Icon(
                    Icons.person_add_rounded,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Ilovamizdan Ro'yxatdan o'ting",
                  style: AppTextStyle.montserratBold.copyWith(
                    fontSize: 24,
                    color: Colors.blue[800],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Barcha xususiyatlarni ochish va tajribangizni shaxsiylashtirish uchun profilingizni yarating.',
                  style: AppTextStyle.montserratRegular.copyWith(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    context.router.pushNamed('/register');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    backgroundColor: Colors.blue[700],
                    shadowColor: Colors.blue.withOpacity(0.4),
                  ),
                  child: Text(
                    'Boshlash',
                    style: AppTextStyle.montserratBold.copyWith(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
