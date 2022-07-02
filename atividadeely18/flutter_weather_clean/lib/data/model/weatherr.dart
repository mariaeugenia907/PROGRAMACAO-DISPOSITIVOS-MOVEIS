import 'package:flutter/foundation.dart';

@immutable
class Weather {
  final String cityName;
  final double temperatureCelsius;

  @override
  int get hashCode => cityName.hashCode ^ temperatureCelsius.hashCode;

  const Weather({
    required this.cityName,
    required this.temperatureCelsius,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Weather &&
        o.cityName == cityName &&
        o.temperatureCelsius == temperatureCelsius;
  }
}
