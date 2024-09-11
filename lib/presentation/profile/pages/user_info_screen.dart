import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/data/user/models/user_model.dart';
import 'package:top_joy/injection.dart';
import 'package:top_joy/presentation/auth/widgets/text_feild_widget.dart';

import '../../../core/utils/app_color.dart';
import '../../auth/widgets/date_picker_modal.dart';
import '../../auth/widgets/gender_option.dart';
import '../../auth/widgets/toasts_widget.dart';

@RoutePage()
class UserInfoScreen extends StatefulWidget {
  final UserModel userModel;
  const UserInfoScreen({super.key, required this.userModel});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _birthdayController = TextEditingController();
  String _gender = '';

  final _formKey = GlobalKey<FormState>();

  Future<void> savePhoneNumber() async {
    final perfs = getIt<SharedPreferences>();
    perfs.setString('phoneNumber', widget.userModel.phoneNumber);
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
  void initState() {
    super.initState();
    _firstNameController.text = widget.userModel.firstName;
    _lastNameController.text = widget.userModel.lastName;
    _birthdayController.text =
        DateFormat('yyyy-MM-dd').format(widget.userModel.birthday);
    _gender = widget.userModel.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            _gender.isNotEmpty) {
                          // Add your submit logic here
                        } else {
                          _showToast("Iltimos, barcha ma'lumotlarni kiriting!",
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
        ),
      ),
    );
  }
}
