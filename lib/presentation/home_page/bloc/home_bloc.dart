import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/weatherforecast_item_model.dart';
import 'package:weather_app/presentation/home_page/models/home_model.dart';
part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  List<WeatherforecastItemModel> fillWeatherforecastItemList() {
    return [
      WeatherforecastItemModel(
          weatherImage: ImageConstant.imgFutureWeather1,
          cloudImage: ImageConstant.imgFilterDramaWhiteA700,
          weatherText: "Overcast",
          temperatureText: "80°",
          labelText: "Today"),
      WeatherforecastItemModel(
          weatherImage: ImageConstant.imgFutureWeather2,
          cloudImage: ImageConstant.imgThunderstorm,
          weatherText: "Thunderstorms",
          temperatureText: "78°",
          labelText: "Tomorrow"),
      WeatherforecastItemModel(
          weatherImage: ImageConstant.imgFutureWeather3,
          cloudImage: ImageConstant.imgBrightnessWhiteA700,
          weatherText: "Sunny",
          temperatureText: "83°",
          labelText: "Wednesday")
    ];
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
    emit(state.copyWith(
        homeModelObj: state.homeModelObj?.copyWith(
      weatherforecastItemList: fillWeatherforecastItemList(),
    )));
  }
}
