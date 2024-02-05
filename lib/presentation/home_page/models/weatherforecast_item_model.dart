import '../../../core/app_export.dart';

/// This class is used in the [weatherforecast_item_widget] screen.
class WeatherforecastItemModel {
  WeatherforecastItemModel({
    this.weatherImage,
    this.cloudImage,
    this.weatherText,
    this.temperatureText,
    this.labelText,
    this.id,
  }) {
    weatherImage = weatherImage ?? ImageConstant.imgFutureWeather1;
    cloudImage = cloudImage ?? ImageConstant.imgFilterDramaWhiteA700;
    weatherText = weatherText ?? "Overcast";
    temperatureText = temperatureText ?? "80°";
    labelText = labelText ?? "Today";
    id = id ?? "";
  }

  String? weatherImage;

  String? cloudImage;

  String? weatherText;

  String? temperatureText;

  String? labelText;

  String? id;
}
