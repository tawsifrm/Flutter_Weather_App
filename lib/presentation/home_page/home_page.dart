import '../home_page/widgets/weatherforecast_item_widget.dart';
import 'bloc/home_bloc.dart';
import 'models/home_model.dart';
import 'models/weatherforecast_item_model.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState(
        homeModelObj: HomeModel(),
      ))
        ..add(HomeInitialEvent()),
      child: HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.h),
            child: Column(
              children: [
                SizedBox(height: 10.v),
                _buildHeader(context),
                SizedBox(height: 10.v),
                _buildCurrentWeather(context),
                SizedBox(height: 9.v),
                _buildHourlyWeather(context),
                SizedBox(height: 10.v),
                _buildWeatherForecast(context),
                Spacer(),
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    height: 4.v,
                    width: 32.h,
                    decoration: BoxDecoration(
                      color: appTheme.gray6007e,
                      borderRadius: BorderRadius.circular(
                        2.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgAppLogo,
          height: 45.adaptSize,
          width: 45.adaptSize,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: BlocSelector<HomeBloc, HomeState, TextEditingController?>(
              selector: (state) => state.searchController,
              builder: (context, searchController) {
                return CustomSearchView(
                  controller: searchController,
                  hintText: "msg_seattle_washington".tr,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildCurrentWeather(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: appTheme.black900.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Container(
        height: 202.v,
        width: 345.h,
        decoration: AppDecoration.fillBlack.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgHeroCurrentWeather,
              height: 202.v,
              width: 345.h,
              radius: BorderRadius.circular(
                16.h,
              ),
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgBrightness,
                            height: 80.v,
                            width: 85.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 18.h,
                              top: 5.v,
                              bottom: 7.v,
                            ),
                            child: Text(
                              "lbl_75".tr,
                              style: theme.textTheme.displayLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 13.v),
                    Text(
                      "lbl_partly_cloudy".tr,
                      style: CustomTextStyles.titleMediumWhiteA700,
                    ),
                    SizedBox(height: 5.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 2.h,
                        right: 3.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "lbl_feels_like_75".tr,
                            style: CustomTextStyles.labelMediumWhiteA700,
                          ),
                          SizedBox(
                            height: 13.v,
                            width: 73.h,
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "lbl_wind_5_mph".tr,
                                    style:
                                        CustomTextStyles.labelMediumWhiteA700,
                                  ),
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgUser,
                                  height: 10.adaptSize,
                                  width: 10.adaptSize,
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.only(left: 29.h),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "msg_visibility_10_0".tr,
                            style: CustomTextStyles.labelMediumWhiteA700,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 1.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.v),
                          child: Text(
                            "msg_pressure_34_26_in".tr,
                            style: CustomTextStyles.labelMediumWhiteA700,
                          ),
                        ),
                        Text(
                          "lbl_humidity_43".tr,
                          style: CustomTextStyles.labelMediumWhiteA700,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.v),
                          child: Text(
                            "lbl_dew_point_55".tr,
                            style: CustomTextStyles.labelMediumWhiteA700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 2.v),
                          child: Text(
                            "lbl_air_quality".tr,
                            style: CustomTextStyles.labelMediumWhiteA700,
                          ),
                        ),
                        Container(
                          width: 25.h,
                          margin: EdgeInsets.only(left: 3.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.h,
                            vertical: 1.v,
                          ),
                          decoration: AppDecoration.fillLightGreenA.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder6,
                          ),
                          child: Text(
                            "lbl_42".tr,
                            style: CustomTextStyles.labelMediumWhiteA700Bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHourlyWeather(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: appTheme.whiteA700,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Container(
        height: 200.v,
        width: 345.h,
        padding: EdgeInsets.all(6.h),
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 18.h),
                child: SizedBox(
                  height: 158.v,
                  child: VerticalDivider(
                    width: 1.h,
                    thickness: 1.v,
                    color: appTheme.blue100,
                    indent: 19.h,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 118.h),
                child: SizedBox(
                  height: 158.v,
                  child: VerticalDivider(
                    width: 1.h,
                    thickness: 1.v,
                    color: appTheme.blue100,
                    indent: 19.h,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 114.h),
                child: SizedBox(
                  height: 158.v,
                  child: VerticalDivider(
                    width: 1.h,
                    thickness: 1.v,
                    indent: 19.h,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 14.h),
                child: SizedBox(
                  height: 158.v,
                  child: VerticalDivider(
                    width: 1.h,
                    thickness: 1.v,
                    indent: 19.h,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 38.v,
                width: 329.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.v),
                        child: SizedBox(
                          width: 300.h,
                          child: Divider(
                            color: appTheme.blue50,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 20.v,
                                  child: VerticalDivider(
                                    width: 5.h,
                                    thickness: 5.v,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.v,
                                  child: VerticalDivider(
                                    width: 5.h,
                                    thickness: 5.v,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.v,
                                  child: VerticalDivider(
                                    width: 5.h,
                                    thickness: 5.v,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.v,
                                  child: VerticalDivider(
                                    width: 5.h,
                                    thickness: 5.v,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.v),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "lbl_8_00_am".tr,
                                style: theme.textTheme.labelMedium,
                              ),
                              Spacer(
                                flex: 34,
                              ),
                              Text(
                                "lbl_9_00_am".tr,
                                style: theme.textTheme.labelMedium,
                              ),
                              Spacer(
                                flex: 37,
                              ),
                              Text(
                                "lbl_10_00_am".tr,
                                style: theme.textTheme.labelMedium,
                              ),
                              Spacer(
                                flex: 27,
                              ),
                              Text(
                                "lbl_11_00_am".tr,
                                style: theme.textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 64.v,
                width: 321.h,
                margin: EdgeInsets.only(bottom: 52.v),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 35.v,
                        width: 301.h,
                        margin: EdgeInsets.only(bottom: 4.v),
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgVector1,
                              height: 35.v,
                              width: 301.h,
                              alignment: Alignment.center,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 10.adaptSize,
                                width: 10.adaptSize,
                                margin: EdgeInsets.only(
                                  left: 95.h,
                                  top: 5.v,
                                ),
                                decoration: BoxDecoration(
                                  color: appTheme.lightBlueA700,
                                  borderRadius: BorderRadius.circular(
                                    5.h,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 10.adaptSize,
                        width: 10.adaptSize,
                        margin: EdgeInsets.only(left: 5.h),
                        decoration: BoxDecoration(
                          color: appTheme.lightBlueA700,
                          borderRadius: BorderRadius.circular(
                            5.h,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 10.adaptSize,
                        width: 10.adaptSize,
                        margin: EdgeInsets.only(
                          top: 20.v,
                          right: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: appTheme.lightBlueA700,
                          borderRadius: BorderRadius.circular(
                            5.h,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 10.adaptSize,
                        width: 10.adaptSize,
                        margin: EdgeInsets.only(
                          top: 20.v,
                          right: 106.h,
                        ),
                        decoration: BoxDecoration(
                          color: appTheme.lightBlueA700,
                          borderRadius: BorderRadius.circular(
                            5.h,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 18.v),
                        child: Text(
                          "lbl_75".tr,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 100.h,
                          top: 6.v,
                        ),
                        child: Text(
                          "lbl_77".tr,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "lbl_79".tr,
                            style: theme.textTheme.bodySmall,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 81.h),
                            child: Text(
                              "lbl_79".tr,
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 6.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Text(
                          "lbl_partly_cloudy".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                        SizedBox(height: 10.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgUserGray800,
                          height: 38.v,
                          width: 41.h,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 50.h,
                        bottom: 2.v,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "lbl_cloudy".tr,
                            style: theme.textTheme.labelMedium,
                          ),
                          SizedBox(height: 13.v),
                          CustomImageView(
                            imagePath: ImageConstant.imgCloudy,
                            height: 33.v,
                            width: 45.h,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 50.h,
                        bottom: 2.v,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "lbl_overcast".tr,
                            style: theme.textTheme.labelMedium,
                          ),
                          SizedBox(height: 14.v),
                          CustomImageView(
                            imagePath: ImageConstant.imgFilterDrama,
                            height: 33.v,
                            width: 45.h,
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
      ),
    );
  }

  /// Section Widget
  Widget _buildWeatherForecast(BuildContext context) {
    return SizedBox(
      height: 200.v,
      child: BlocSelector<HomeBloc, HomeState, HomeModel?>(
        selector: (state) => state.homeModelObj,
        builder: (context, homeModelObj) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 7.h,
              );
            },
            itemCount: homeModelObj?.weatherforecastItemList.length ?? 0,
            itemBuilder: (context, index) {
              WeatherforecastItemModel model =
                  homeModelObj?.weatherforecastItemList[index] ??
                      WeatherforecastItemModel();
              return WeatherforecastItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
