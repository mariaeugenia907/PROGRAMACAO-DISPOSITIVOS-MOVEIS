import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../bloc/weatherr_bloc.dart';
import '../data/model/weatherr.dart';
import '../data/weatherr_repository.dart';

part 'weatherr_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(const WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(const WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(const WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
