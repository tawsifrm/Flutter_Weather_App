import '../models/weatherforecast_item_model.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/app_export.dart';

// ignore: must_be_immutable
class WeatherforecastItemWidget extends StatelessWidget {
  WeatherforecastItemWidget(
    this.weatherforecastItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  WeatherforecastItemModel weatherforecastItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.v,
      width: 110.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: weatherforecastItemModelObj?.weatherImage,
            height: 200.v,
            width: 110.h,
            radius: BorderRadius.circular(
              16.h,
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: AppDecoration.outlineBlack900,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    imagePath: weatherforecastItemModelObj?.cloudImage,
                    height: 33.v,
                    width: 45.h,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 29.h),
                  ),
                  SizedBox(height: 31.v),
                  Text(
                    weatherforecastItemModelObj.weatherText!,
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 11.v),
                  Text(
                    weatherforecastItemModelObj.temperatureText!,
                    style: theme.textTheme.displaySmall,
                  ),
                  SizedBox(height: 1.v),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 37.h,
                      vertical: 3.v,
                    ),
                    decoration: AppDecoration.fillWhiteA.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderBL16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 1.v),
                        Text(
                          weatherforecastItemModelObj.labelText!,
                          style: CustomTextStyles.labelLargeGray900Bold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
