import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:top_joy/core/navigation/app_router.gr.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/injection.dart';
import 'package:top_joy/presentation/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:top_joy/presentation/auth/bloc/auth_bloc/auth_event.dart';
import 'package:top_joy/presentation/auth/bloc/verify_code_bloc/verify_bloc.dart';
import 'package:top_joy/presentation/auth/widgets/toasts_widget.dart';

import '../../main/bloc/navigation_cubit.dart';

@RoutePage()
class SmsScreen extends StatefulWidget {
  final String phoneNumber;
  const SmsScreen({super.key, required this.phoneNumber});

  @override
  State<SmsScreen> createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> with CodeAutoFill {
  final TextEditingController _pinController = TextEditingController();
  Timer? _timer;
  int _remainingSeconds = 120;
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    listenForCode();
    _startTimer();
  }

  @override
  void codeUpdated() {
    if (code != null) {
      setState(() {
        _pinController.text = code!;
      });
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _isButtonVisible = true;
          _timer?.cancel();
        }
      });
    });
  }

  void _verifyCode() {
    if (_pinController.text.isEmpty) {
      _showToast("SMS kirtilmadi!");
    } else {
      context.read<VerifyBloc>().add(
            VerifyCodeEvent(
              widget.phoneNumber,
              _pinController.text,
            ),
          );
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    cancel();
    _timer?.cancel();
    super.dispose();
  }

  void _showToast(String message,
      {Color backgroundColor = Colors.red, IconData icon = Icons.error}) {
    ToastService().showToast(
      message: message,
      backgroundColor: backgroundColor,
      icon: icon,
    );
  }

  Future<void> _register() async {
    final prefs = getIt<SharedPreferences>();
    prefs.setBool('isRegistor', true);
  }

  void _resendCode() {
    setState(() {
      _remainingSeconds = 120;
      _isButtonVisible = false;
      context.read<AuthBloc>().add(SendOTPEvent(widget.phoneNumber));
      _startTimer();
    });

    _showToast("SMS qayta jo'natildi", backgroundColor: Colors.green);
  }

  String _formatTime(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tasdiq kodi",
              style: AppTextStyle.montserratBold.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 30),
            Text(
              "SMS-dan 4 xonali kodni kiriting",
              style: AppTextStyle.montserratRegular
                  .copyWith(color: AppColor.regularTextColor, fontSize: 17),
            ),
            Text(
              widget.phoneNumber,
              style: AppTextStyle.montserratMedium.copyWith(fontSize: 17),
            ),
            const SizedBox(height: 30),
            Text(
              "SMS kod",
              style: AppTextStyle.montserratMedium
                  .copyWith(color: AppColor.regularTextColor, fontSize: 17),
            ),
            const SizedBox(height: 10),
            Pinput(
              onCompleted: (value) {
                _verifyCode();
              },
              length: 4,
              controller: _pinController,
              defaultPinTheme: PinTheme(
                width: 45,
                height: 45,
                textStyle: AppTextStyle.montserratBold
                    .copyWith(fontSize: 20, color: AppColor.buttonColor),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.buttonColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 45,
                height: 45,
                textStyle: AppTextStyle.montserratBold
                    .copyWith(fontSize: 20, color: AppColor.buttonColor),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.buttonColor),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            BlocConsumer<VerifyBloc, VerifyState>(
              builder: (context, state) {
                if (state is VerifyLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
                    if (_isButtonVisible)
                      TextButton(
                        onPressed: _resendCode,
                        child: Text(
                          "SMS qayta jo'natish",
                          style: AppTextStyle.montserratMedium.copyWith(
                              color: AppColor.buttonColor, fontSize: 17),
                        ),
                      ),
                    if (!_isButtonVisible)
                      Text(
                        "Qayta jo'natish uchun vaqt: ${_formatTime(_remainingSeconds)}",
                        style: AppTextStyle.montserratRegular.copyWith(
                            color: AppColor.regularTextColor, fontSize: 15),
                      ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _verifyCode,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fixedSize: Size(MediaQuery.of(context).size.width, 50),
                      ),
                      child: Text(
                        'Tasdiqlash',
                        style: AppTextStyle.montserratMedium
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
              listener: (context, state) async {
                if (state is VerifySuccess) {
                  _register();
                  context.router.pushAndPopUntil(
                    MainRoute(),
                    predicate: (route) => false,
                  );
                  context.read<NavigationCubit>().pages[2];
                }
                if (state is VerifyFailure) {
                  if (state.error.contains('400')) {
                    _showToast(
                      "Iltimos, yaroqli kodni kiriting!",
                    );
                  }
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
