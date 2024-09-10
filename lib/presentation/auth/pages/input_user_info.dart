import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/domain/user/entity/user_post.dart';
import 'package:top_joy/injection.dart';
import 'package:top_joy/presentation/auth/widgets/text_feild_widget.dart';
import '../../../core/navigation/app_router.gr.dart';
import '../../main/bloc/navigation_cubit.dart';
import '../bloc/user_info_input/user_input_bloc.dart';
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

  void _showCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 250,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            dateOrder: DatePickerDateOrder.dmy,
            minimumDate: DateTime(1900),
            maximumDate: DateTime(2101),
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                _birthdayController.text =
                    DateFormat('dd-MM-yyyy').format(newDate);
              });
            },
          ),
        );
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
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<UserInputBloc, UserInputState>(
          listener: (context, state) {
            if (state is UserPostSuccess) {
              _register();
              savePhoneNumber();

              _showToast("Muvaffaqiyatli ro'yxatdan o'tdingiz!");

              context.router.pushAndPopUntil(
                const MainRoute(),
                predicate: (route) => false,
              );
              context.read<NavigationCubit>().pages[2];
            } else if (state is UserPostFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text('Failed to submit user info: ${state.error}')),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tafsilotlaringizni kiriting",
                    style: AppTextStyle.montserratBold.copyWith(fontSize: 25),
                  ),
                  const SizedBox(height: 16),
                  TextFeildWidget(
                    controller: _firstNameController,
                    label: "Ism",
                    hintText: "Ismingizni kiriting",
                  ),
                  const SizedBox(height: 16),
                  TextFeildWidget(
                    controller: _lastNameController,
                    label: "Familiya",
                    hintText: "Familiya kiriting",
                  ),
                  const SizedBox(height: 16),
                  TextFeildWidget(
                    controller: _birthdayController,
                    label: "Tug'ilgan sana",
                    hintText: "Tug'ilgan sanani tanlang",
                    onTap: () {
                      _showCupertinoDatePicker(context);
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Jins',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Мужчина'),
                            value: 'Мужчина',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Женщина'),
                            value: 'Женщина',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
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
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.green,
                          ),
                          child: const Text(
                            'Davom etish',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
