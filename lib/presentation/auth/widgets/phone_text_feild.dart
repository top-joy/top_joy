import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';

import '../../../src/gen/assets.gen.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController phoneController;

  const PhoneInputField({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Telefon raqamini kiriting';
        } else if (value.length != 12) {
          return "To'g'ri raqam kiriting";
        }
        return null;
      },
      controller: phoneController,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      keyboardType: TextInputType.phone,
      inputFormatters: [
        MaskedInputFormatter('## ### ## ##',
            allowedCharMatcher: RegExp(r'[0-9]')),
      ],
      decoration: InputDecoration(
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset(
                Assets.icons.bayroq.path,
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(width: 8),
            const Padding(
              padding: EdgeInsets.only(bottom: 1),
              child: Text(
                '+998 ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        hintStyle: AppTextStyle.montserratRegular
            .copyWith(color: AppColor.regularTextColor, fontSize: 16),
        hintText: 'Telefon raqamingizni kiriting',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
      ),
    );
  }
}
