import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';
import 'package:top_joy/presentation/detail_screen/widgets/amenities_section.dart';
import 'package:top_joy/presentation/detail_screen/widgets/description_section.dart';
import 'package:top_joy/presentation/detail_screen/widgets/distance_calkulator.dart';
import 'package:top_joy/presentation/detail_screen/widgets/location_section.dart';
import 'package:top_joy/presentation/detail_screen/widgets/working_hours_section.dart';

class DetailBody extends StatefulWidget {
  final ServiceModels serviceModels;

  const DetailBody({
    super.key,
    required this.serviceModels,
  });

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  double? _distance;

  @override
  void initState() {
    super.initState();
    _calculateDistance();
  }

  Future<void> _calculateDistance() async {
    DistanceCalculator calculator = DistanceCalculator(
      destinationLatitude: widget.serviceModels.latitude!,
      destinationLongitude: widget.serviceModels.longitude!,
    );

    double distance = await calculator.calculateDistance();

    setState(() {
      _distance = distance;
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Qo\'ng\'iroq qilish mumkin emas: $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.serviceModels.name,
            style: AppTextStyle.montserratBold.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.location_on_rounded,
                color: Colors.green,
                size: 20,
              ),
              _distance != null
                  ? Text(
                      'Sizdan ${_distance!.toStringAsFixed(1)} km uzoqlikda.',
                      style: AppTextStyle.montserratMedium.copyWith(
                        color: AppColor.regularTextColor,
                      ),
                    )
                  : const CircularProgressIndicator(
                      color: AppColor.textFeildBackColor,
                    ),
            ],
          ),
          Divider(height: 30, color: Colors.grey.shade200),
          WorkingHoursSection(serviceModels: widget.serviceModels),
          const SizedBox(height: 20),
          AmenitiesSection(amenities: widget.serviceModels.amenities),
          const SizedBox(height: 20),
          DescriptionSection(description: widget.serviceModels.description),
          const SizedBox(height: 20),
          LocationSection(serviceModels: widget.serviceModels),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              _makePhoneCall(widget.serviceModels.phone_1);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColor.textFeildBackColor,
              fixedSize: const Size(150, 40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.call, color: AppColor.buttonColor),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    "Bog'lanish",
                    style: AppTextStyle.montserratBold.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
