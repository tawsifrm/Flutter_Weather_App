import 'bloc/radar_bloc.dart';
import 'dart:async';
import 'models/radar_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/widgets/custom_floating_button.dart';
import 'package:weather_app/widgets/custom_icon_button.dart';
import 'package:weather_app/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class RadarPage extends StatelessWidget {
  RadarPage({Key? key})
      : super(
          key: key,
        );

  Completer<GoogleMapController> googleMapController = Completer();

  static Widget builder(BuildContext context) {
    return BlocProvider<RadarBloc>(
      create: (context) => RadarBloc(RadarState(
        radarModelObj: RadarModel(),
      ))
        ..add(RadarInitialEvent()),
      child: RadarPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 10.v),
          decoration: AppDecoration.fillWhiteA,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.h),
            child: Column(
              children: [
                _buildHeader(context),
                SizedBox(height: 10.v),
                _buildRadar(context),
                SizedBox(height: 11.v),
                _buildSeventeen(context),
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
        floatingActionButton: _buildFloatingActionButton(context),
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
            child: BlocSelector<RadarBloc, RadarState, TextEditingController?>(
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
  Widget _buildRadar(BuildContext context) {
    return SizedBox(
      height: 550.v,
      width: 345.h,
      child: GoogleMap(
        //TODO: Add your Google Maps API key in AndroidManifest.xml and pod file
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            37.43296265331129,
            -122.08832357078792,
          ),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          googleMapController.complete(controller);
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventeen(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 2.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.v),
            child: CustomIconButton(
              height: 50.adaptSize,
              width: 50.adaptSize,
              padding: EdgeInsets.all(4.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgPlayCircle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 17.v,
            ),
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgSlider,
                  height: 20.v,
                  width: 212.h,
                ),
                SizedBox(height: 2.v),
                Container(
                  width: 212.h,
                  margin: EdgeInsets.only(left: 3.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_now".tr,
                        style: CustomTextStyles.labelLargeBlack900,
                      ),
                      Text(
                        "lbl_10_00_am".tr,
                        style: CustomTextStyles.labelLargeBlack900,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return CustomFloatingButton(
      height: 50,
      width: 50,
      backgroundColor: appTheme.blue100,
      child: CustomImageView(
        imagePath: ImageConstant.imgGrid,
        height: 25.0.v,
        width: 25.0.h,
      ),
    );
  }
}
