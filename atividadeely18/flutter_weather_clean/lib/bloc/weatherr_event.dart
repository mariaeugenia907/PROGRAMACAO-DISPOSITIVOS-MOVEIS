part of 'weatherr_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWeather extends WeatherEvent {
  final String cityName;

  @override
  List<Object?> get props => [cityName];

  const GetWeather(this.cityName);
}
