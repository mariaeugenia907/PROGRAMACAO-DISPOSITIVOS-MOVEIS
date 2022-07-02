part of 'weatherr_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];

  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];

  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  @override
  List<Object> get props => [weather];

  const WeatherLoaded(this.weather);
}

class WeatherError extends WeatherState {
  final String message;
  @override
  List<Object> get props => [message];

  const WeatherError(this.message);
}
