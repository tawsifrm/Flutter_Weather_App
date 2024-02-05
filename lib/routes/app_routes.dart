import 'package:flutter/material.dart';
import 'package:weather_app/presentation/home_container_screen/home_container_screen.dart';
import 'package:weather_app/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String radarPage = '/radar_page';

  static const String newsPage = '/news_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        homeContainerScreen: HomeContainerScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: HomeContainerScreen.builder
      };
}
