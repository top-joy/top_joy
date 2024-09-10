import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_joy/core/error/failure.dart';

abstract class LocationService {
  Future<Position> updateAndGetCurrentPosition();
}

class LocationServiceImpl implements LocationService {
  final SharedPreferences _prefs;

  LocationServiceImpl(this._prefs);

  @override
  Future<Position> updateAndGetCurrentPosition() async {
    try {
      final position = await _determineAndSaveCurrentPosition();
      return position;
    } catch (e) {
      log('Error updating location: $e');
      rethrow;
    }
  }

  Future<Position> _determineAndSaveCurrentPosition() async {
    if (!await _isLocationServiceEnabled()) {
      throw LocationFailure('Location services are disabled.');
    }

    final permission = await _checkAndRequestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      throw LocationFailure('Location permissions are denied.');
    }

    final position = await Geolocator.getCurrentPosition();
    await _saveLocationToSharedPreferences(position);

    return position;
  }

  Future<bool> _isLocationServiceEnabled() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    return serviceEnabled;
  }

  Future<LocationPermission> _checkAndRequestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  Future<void> _saveLocationToSharedPreferences(Position position) async {
    await _prefs.setDouble('latitude', position.latitude);
    await _prefs.setDouble('longitude', position.longitude);
    log('Location updated and saved: Lat: ${position.latitude}, Long: ${position.longitude}');
  }
}
