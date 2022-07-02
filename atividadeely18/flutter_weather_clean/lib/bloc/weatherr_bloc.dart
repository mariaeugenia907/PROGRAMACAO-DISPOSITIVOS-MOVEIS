import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_clean/cubit/weatherr_cubit.dart';

import '../data/model/weatherr.dart';
import '../data/weatherr_repository.dart';

part 'weatherr_event.dart';
part 'weatherr_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(const WeatherInitial()) {
    on<GetWeather>((event, emit) async {
      try {
        emit(const WeatherLoading());
        final weather = await _weatherRepository.fetchWeather(event.cityName);
        emit(WeatherLoaded(weather));
      } on NetworkException {
        emit(const WeatherError(
            "Couldn't fetch weather. Is the device online?"));
      }
    });
  }
}
