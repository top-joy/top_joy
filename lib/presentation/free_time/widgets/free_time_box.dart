import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/data/free_time/models/free_time_model.dart';

class FreeTimeBox extends StatefulWidget {
  final FreeTime freeTime;
  final bool isSelected;
  final void Function(FreeTime) onTap;

  const FreeTimeBox({
    super.key,
    required this.freeTime,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<FreeTimeBox> createState() => _FreeTimeBoxState();
}

class _FreeTimeBoxState extends State<FreeTimeBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          widget.freeTime.status ? widget.onTap(widget.freeTime) : null,
      child: Container(
        decoration: BoxDecoration(
          color: widget.freeTime.status
              ? AppColor.textFeildBackColor
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.freeTime.startTime}-${widget.freeTime.endTime}',
                style: AppTextStyle.montserratBold.copyWith(
                  fontSize: 16,
                  color: widget.freeTime.status ? Colors.black : Colors.grey,
                ),
              ),
              if (widget.freeTime.status)
                Container(
                  width: 21,
                  height: 21,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      width: 1.5,
                      color: widget.isSelected
                          ? const Color(0xff7F56D9)
                          : Colors.transparent,
                    ),
                  ),
                  child: Center(
                    child: widget.isSelected
                        ? const Icon(
                            Icons.check_rounded,
                            size: 18,
                            color: Color(0xff7F56D9),
                          )
                        : null,
                  ),
                )
              else
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Band",
                      style: AppTextStyle.montserratBold
                          .copyWith(color: Colors.red),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
