import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DistanceCalculator {
  final double destinationLatitude;
  final double destinationLongitude;

  DistanceCalculator({
    required this.destinationLatitude,
    required this.destinationLongitude,
  });

  Future<double> calculateDistance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    double? storedLatitude = prefs.getDouble('latitude');
    double? storedLongitude = prefs.getDouble('longitude');

    if (storedLatitude == null || storedLongitude == null) {
      Position position = await Geolocator.getCurrentPosition();
      storedLatitude = position.latitude;
      storedLongitude = position.longitude;

      await prefs.setDouble('latitude', storedLatitude);
      await prefs.setDouble('longitude', storedLongitude);
    }

    double distanceInMeters = Geolocator.distanceBetween(
      storedLatitude,
      storedLongitude,
      destinationLatitude,
      destinationLongitude,
    );

    return distanceInMeters / 1000;
  }
}
