import 'package:flutter/material.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';
import 'package:top_joy/presentation/detail_screen/widgets/distance_calkulator.dart';
import 'package:top_joy/src/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class LocationSection extends StatefulWidget {
  final ServiceModels serviceModels;

  const LocationSection({
    super.key,
    required this.serviceModels,
  });

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {
  late YandexMapController _mapController;
  late double _distance;

  @override
  void initState() {
    super.initState();
    _distance = widget.serviceModels.distance ?? 0;
    _calculateDistance();
  }

  Future<void> _openMap(double latitude, double longitude) async {
    final Uri url =
        Uri.parse('geo:$latitude,$longitude?q=$latitude,$longitude');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Navigatsiya ilovasi ochilmadi';
    }
  }

  Future<void> _calculateDistance() async {
    if (widget.serviceModels.latitude != null &&
        widget.serviceModels.longitude != null) {
      final calculator = DistanceCalculator(
        destinationLatitude: widget.serviceModels.latitude!,
        destinationLongitude: widget.serviceModels.longitude!,
      );
      final distance = await calculator.calculateDistance();
      setState(() {
        _distance = distance;
      });
    }
  }

  Future<void> _updateMapLocation() async {
    if (widget.serviceModels.latitude != null &&
        widget.serviceModels.longitude != null) {
      await _mapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(
              latitude: widget.serviceModels.latitude!,
              longitude: widget.serviceModels.longitude!,
            ),
            zoom: 13,
          ),
        ),
        animation: const MapAnimation(
          type: MapAnimationType.smooth,
          duration: 0.2,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Joylashuv',
          style: AppTextStyle.montserratBold.copyWith(fontSize: 17),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: SizedBox(
                    height: 150,
                    child: YandexMap(
                      mapObjects: [
                        if (widget.serviceModels.latitude != null &&
                            widget.serviceModels.longitude != null)
                          PlacemarkMapObject(
                            opacity: 1,
                            mapId: const MapObjectId("location"),
                            point: Point(
                              latitude: widget.serviceModels.latitude!,
                              longitude: widget.serviceModels.longitude!,
                            ),
                            icon: PlacemarkIcon.single(
                              PlacemarkIconStyle(
                                scale: .16,
                                image: BitmapDescriptor.fromAssetImage(
                                  Assets.icons.pin.path,
                                ),
                              ),
                            ),
                          ),
                      ],
                      onMapCreated: (controller) {
                        _mapController = controller;
                        _updateMapLocation();
                      },
                      zoomGesturesEnabled: false,
                      scrollGesturesEnabled: false,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.serviceModels.address,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.montserratBold,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Assets.images.navigator.svg(),
                          const SizedBox(width: 8),
                          Text(
                            "${_distance.toStringAsFixed(1)} km uzoqlikda.",
                            style: AppTextStyle.montserratMedium.copyWith(
                              color: AppColor.regularTextColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        color: Colors.grey[300],
                        height: 0,
                      ),
                      InkWell(
                        onTap: () {
                          _openMap(widget.serviceModels.latitude!,
                              widget.serviceModels.longitude!);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            bottom: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Marshrutni qurish",
                                style: AppTextStyle.montserratBold.copyWith(
                                  color: AppColor.buttonColor,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColor.buttonColor,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
