import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_text_style.dart';

class DatePickerModal extends StatelessWidget {
  final TextEditingController birthdayController;

  const DatePickerModal({super.key, required this.birthdayController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).copyWith().size.height / 2.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.regularTextColor,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 30,
            child: Text(
              'Sanani tanlang',
              style: AppTextStyle.montserratBold.copyWith(fontSize: 20),
            ),
          ),
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              dateOrder: DatePickerDateOrder.dmy,
              itemExtent: 40,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newDate) {
                birthdayController.text = DateFormat('dd-MM-yyyy').format(newDate);
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Tanlang',
                  style: AppTextStyle.montserratBold
                      .copyWith(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
