import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';
import 'package:top_joy/presentation/map_screen/widgets/service_detail_bottom_sheet.dart';
import 'package:top_joy/src/gen/assets.gen.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../home/bloc/service_data_bloc/service_data_bloc.dart';

@RoutePage()
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late YandexMapController _mapController;
  PlacemarkMapObject? _userPlacemark;
  bool _isBottomSheetOpen = false;

  @override
  void initState() {
    super.initState();
    context.read<ServiceBloc>().add(FetchServiceDataEvent());
  }

  Future<void> _getUserLocationAndAnimate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    double? savedLatitude = prefs.getDouble('latitude');
    double? savedLongitude = prefs.getDouble('longitude');

    if (savedLatitude != null && savedLongitude != null) {
      final userLocation = Point(
        latitude: savedLatitude,
        longitude: savedLongitude,
      );

      await _mapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: userLocation, zoom: 15),
        ),
        animation:
            const MapAnimation(type: MapAnimationType.smooth, duration: 2),
      );

      setState(() {
        _userPlacemark = PlacemarkMapObject(
          mapId: const MapObjectId("user_location"),
          point: userLocation,
          opacity: 1,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage(Assets.icons.pin.path),
              scale: 0.2,
            ),
          ),
        );
      });
    } else {
      Position position = await Geolocator.getCurrentPosition();
      final userLocation = Point(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      await prefs.setDouble('latitude', position.latitude);
      await prefs.setDouble('longitude', position.longitude);

      await _mapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: userLocation, zoom: 15),
        ),
        animation:
            const MapAnimation(type: MapAnimationType.smooth, duration: 2),
      );

      setState(() {
        _userPlacemark = PlacemarkMapObject(
          mapId: const MapObjectId("user_location"),
          point: userLocation,
          opacity: 1,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage(Assets.icons.pin.path),
              scale: 0.2,
            ),
          ),
        );
      });
    }
  }

  void _showServiceDetailsBottomSheet(
      BuildContext context, List<ServiceModels> services) {
    if (_isBottomSheetOpen) return;

    _isBottomSheetOpen = true;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ServiceDetailsBottomSheet(services: services);
      },
    ).whenComplete(() {
      _isBottomSheetOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (context, state) {
          if (state is ServiceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ServiceError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is ServiceLoaded) {
            final serviceData = state.serviceData;
            return Stack(
              children: [
                YandexMap(
                  onMapCreated: (controller) {
                    _mapController = controller;
                    _getUserLocationAndAnimate();
                  },
                  mapObjects: [
                    if (_userPlacemark != null) _userPlacemark!,
                    ...serviceData.map((service) {
                      return PlacemarkMapObject(
                        opacity: 1,
                        mapId: MapObjectId(service.id),
                        point: Point(
                          latitude: service.latitude!,
                          longitude: service.longitude!,
                        ),
                        icon: PlacemarkIcon.single(
                          PlacemarkIconStyle(
                            image: BitmapDescriptor.fromAssetImage(
                                Assets.icons.locationSoccer.path),
                            scale: 0.2,
                          ),
                        ),
                        onTap: (placemark, point) {
                          final selectedServices = serviceData
                              .where(
                                (s) =>
                                    s.latitude == service.latitude &&
                                    s.longitude == service.longitude,
                              )
                              .toList();

                          _showServiceDetailsBottomSheet(
                              context, selectedServices);
                        },
                      );
                    }),
                  ],
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: FloatingActionButton(
                    shape: const CircleBorder(),
                    onPressed: _getUserLocationAndAnimate,
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.my_location),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
