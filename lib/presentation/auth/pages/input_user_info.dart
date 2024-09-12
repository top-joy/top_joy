import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/domain/user/entity/user_post.dart';
import 'package:top_joy/injection.dart';
import 'package:top_joy/presentation/auth/bloc/verify_code_bloc/verify_bloc.dart';
import 'package:top_joy/presentation/auth/widgets/text_feild_widget.dart';
import '../../../core/navigation/app_router.gr.dart';
import '../../main/bloc/navigation_cubit.dart';
import '../bloc/user_info_input/user_input_bloc.dart';
import '../widgets/date_picker_modal.dart';
import '../widgets/gender_option.dart';
import '../widgets/toasts_widget.dart';

@RoutePage()
class InputUserInfo extends StatefulWidget {
  final String phoneNumber;
  const InputUserInfo({super.key, required this.phoneNumber});

  @override
  State<InputUserInfo> createState() => _InputUserInfoState();
}

class _InputUserInfoState extends State<InputUserInfo> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _birthdayController = TextEditingController();
  String _gender = '';

  final _formKey = GlobalKey<FormState>();

  Future<void> savePhoneNumber() async {
    final perfs = getIt<SharedPreferences>();
    perfs.setString('phoneNumber', widget.phoneNumber);
  }

  Future<void> _register() async {
    final prefs = getIt<SharedPreferences>();
    await prefs.setBool('isRegistor', true);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void _showDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return DatePickerModal(birthdayController: _birthdayController);
      },
    );
  }

  void _showToast(String message,
      {Color backgroundColor = AppColor.buttonColor,
      IconData icon = Icons.error}) {
    ToastService().showToast(
      message: message,
      backgroundColor: backgroundColor,
      icon: icon,
    );
  }

  void _onGenderSelected(String selectedGender) {
    setState(() {
      _gender = selectedGender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<UserInputBloc, UserInputState>(
          listener: (context, state) {
            if (state is UserPostSuccess) {
              _register();
              savePhoneNumber();
              context.read<VerifyBloc>().add(
                    CheckUserEvent(
                        phoneNumber: widget.phoneNumber.substring(1)),
                  );
              context.router.pushAndPopUntil(
                const MainRoute(),
                predicate: (route) => false,
              );
              context.read<NavigationCubit>().pages[2];

              _showToast("Muvaffaqiyatli ro'yxatdan o'tdingiz!");
            } else if (state is UserPostFailure) {
              _showToast("Foydalanuvchi maʼlumotlarini yuborib boʻlmadi!",
                  backgroundColor: Colors.red);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tafsilotlaringizni kiriting",
                      style: AppTextStyle.montserratBold.copyWith(fontSize: 25),
                    ),
                    const SizedBox(height: 16),
                    TextFieldWidget(
                      controller: _firstNameController,
                      label: "Ism",
                      hintText: "Ismingizni kiriting",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ism kiritilishi kerak";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFieldWidget(
                      controller: _lastNameController,
                      label: "Familiya",
                      hintText: "Familiya kiriting",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Familiya kiritilishi kerak";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFieldWidget(
                      controller: _birthdayController,
                      label: "Tug'ilgan sana",
                      hintText: "Tug'ilgan sanani tanlang",
                      suffixIcon: const Icon(
                        Icons.calendar_today_outlined,
                        color: AppColor.regularTextColor,
                      ),
                      onTap: () {
                        _showDatePicker(context);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Tug'ilgan sana tanlanishi kerak";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Jins',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GenderOptionWidget(
                            option: 'Мужчина',
                            selectedGender: _gender,
                            onSelected: _onGenderSelected),
                        GenderOptionWidget(
                            option: 'Женщина',
                            selectedGender: _gender,
                            onSelected: _onGenderSelected),
                      ],
                    ),
                    if (_gender.isEmpty)
                      const Text(
                        "Jins tanlanishi kerak",
                        style: TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 24),
                    if (state is UserPostLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate() &&
                                  _gender.isNotEmpty) {
                                context.read<UserInputBloc>().add(
                                      UserPostEvent(
                                        UserPost(
                                          birthday: _birthdayController.text,
                                          firstName: _firstNameController.text,
                                          gender: _gender,
                                          lastName: _lastNameController.text,
                                          phoneNumber: widget.phoneNumber,
                                          photo: '',
                                        ),
                                      ),
                                    );
                              } else {
                                _showToast(
                                    "Iltimos, barcha ma'lumotlarni kiriting!",
                                    backgroundColor: Colors.red);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: Colors.green,
                            ),
                            child: Text(
                              'Davom etish',
                              style: AppTextStyle.montserratBold
                                  .copyWith(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
