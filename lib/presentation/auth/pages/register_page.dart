import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_joy/core/navigation/app_router.gr.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/presentation/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:top_joy/presentation/auth/bloc/auth_bloc/auth_event.dart';
import 'package:top_joy/presentation/auth/widgets/phone_text_feild.dart';
import 'package:top_joy/presentation/auth/widgets/toasts_widget.dart';
import '../bloc/auth_bloc/auth_state.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController phoneController = TextEditingController();
  bool consent = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _showToast() {
    ToastService().showToast(
      message:
          "OTP yuborishda xatolik yuz berdi Internetni tekshirib ko'ring va yana qayta urining",
      backgroundColor: Colors.red,
      icon: Icons.error,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sizning telefon raqamingiz',
                style: AppTextStyle.montserratBold.copyWith(fontSize: 23),
              ),
              const SizedBox(height: 15),
              Text(
                "Raqamingizga tasdiqlash kodini yuboramiz",
                style: AppTextStyle.montserratRegular.copyWith(
                  color: AppColor.regularTextColor,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Telefon raqam",
                style: AppTextStyle.montserratBold.copyWith(fontSize: 15),
              ),
              const SizedBox(height: 10),
              PhoneInputField(
                phoneController: phoneController,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        consent = !consent;
                      });
                    },
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: consent ? AppColor.buttonColor : null,
                        border: Border.all(
                          color: AppColor.regularTextColor,
                          width: consent ? 0 : 2,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          consent ? CupertinoIcons.checkmark_alt : null,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Roʻyxatdan oʻtish orqali siz ',
                            style: AppTextStyle.montserratLight
                                .copyWith(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Foydalanish shartlari ',
                            style: AppTextStyle.montserratMedium
                                .copyWith(color: AppColor.buttonColor),
                          ),
                          TextSpan(
                            text: 'va',
                            style: AppTextStyle.montserratLight
                                .copyWith(color: Colors.black),
                          ),
                          TextSpan(
                            text: ' Maxfiylik siyosatimizga ',
                            style: AppTextStyle.montserratMedium
                                .copyWith(color: AppColor.buttonColor),
                          ),
                          TextSpan(
                            text: 'rozilik bildirasiz',
                            style: AppTextStyle.montserratLight
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    context.router
                        .push(SmsRoute(phoneNumber: formatPhoneNumber(phoneController.text)));
                  } else if (state is AuthFailure) {
                    _showToast();
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                    ),
                    onPressed: consent
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              String formattedPhoneNumber =
                                  formatPhoneNumber(phoneController.text);

                              context
                                  .read<AuthBloc>()
                                  .add(SendOTPEvent(formattedPhoneNumber));
                            }
                          }
                        : null,
                    child: Text(
                      'Telefon raqamini tasdiqlang',
                      style: AppTextStyle.montserratMedium.copyWith(
                        color: consent ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String formatPhoneNumber(String phoneNumber) {
  String cleanedNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
  return '+998$cleanedNumber';
}
