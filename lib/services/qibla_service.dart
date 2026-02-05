import 'dart:math';

class QiblaService {
  static const double kaabaLat = 21.4225;
  static const double kaabaLng = 39.8262;

  /// Returns bearing from true north (0-360 degrees)
  static double bearingToKaaba({
    required double userLat,
    required double userLng,
  }) {
    final userLatRad = _degToRad(userLat);
    final userLngRad = _degToRad(userLng);
    final kaabaLatRad = _degToRad(kaabaLat);
    final kaabaLngRad = _degToRad(kaabaLng);

    final dLng = kaabaLngRad - userLngRad;

    final y = sin(dLng);
    final x = cos(userLatRad) * tan(kaabaLatRad) -
        sin(userLatRad) * cos(dLng);

    final bearingRad = atan2(y, x);
    final bearingDeg = (_radToDeg(bearingRad) + 360) % 360;

    return bearingDeg;
  }

  static double _degToRad(double deg) => deg * pi / 180.0;
  static double _radToDeg(double rad) => rad * 180.0 / pi;
}
