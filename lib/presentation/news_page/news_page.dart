import 'bloc/news_bloc.dart';
import 'models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class NewsPage extends StatelessWidget {
  const NewsPage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(NewsState(
        newsModelObj: NewsModel(),
      ))
        ..add(NewsInitialEvent()),
      child: NewsPage(),
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
                _buildHeroCover(context),
                SizedBox(height: 10.v),
                Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: _buildArticle3(
                    context,
                    imageProps: ImageConstant.imgArticleCover,
                    whatToDoIfA: "msg_how_do_meteorologist".tr,
                  ),
                ),
                SizedBox(height: 10.v),
                _buildArticle2(context),
                SizedBox(height: 10.v),
                Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: _buildArticle3(
                    context,
                    imageProps: ImageConstant.imgArticleCover120x120,
                    whatToDoIfA: "msg_what_to_do_if_a".tr,
                  ),
                ),
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
            child: BlocSelector<NewsBloc, NewsState, TextEditingController?>(
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
  Widget _buildHeroCover(BuildContext context) {
    return SizedBox(
      height: 229.v,
      width: 345.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgCover,
            height: 229.v,
            width: 345.h,
            radius: BorderRadius.circular(
              16.h,
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 169.v,
              width: 280.h,
              margin: EdgeInsets.only(top: 20.v),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: AppDecoration.outlineBlack900,
                      child: Text(
                        "lbl_clouds".tr,
                        style: CustomTextStyles.pacificoLightblueA700,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 12.v),
                      decoration: AppDecoration.outlineBlack900,
                      child: Text(
                        "msg_news_from_powerweather".tr,
                        style: CustomTextStyles.headlineSmallGray800,
                      ),
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

  /// Section Widget
  Widget _buildArticle2(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 1.h),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 205.h,
            margin: EdgeInsets.only(
              top: 27.v,
              bottom: 28.v,
            ),
            child: Text(
              "msg_what_s_new_in_powerweather".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headlineSmall!.copyWith(
                height: 1.33,
              ),
            ),
          ),
          Container(
            height: 120.adaptSize,
            width: 120.adaptSize,
            margin: EdgeInsets.only(left: 12.h),
            padding: EdgeInsets.symmetric(
              horizontal: 13.h,
              vertical: 14.v,
            ),
            decoration: AppDecoration.fillLightBlueA.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder16,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgLogo,
              height: 88.adaptSize,
              width: 88.adaptSize,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildArticle3(
    BuildContext context, {
    required String imageProps,
    required String whatToDoIfA,
  }) {
    return Container(
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: imageProps,
            height: 120.adaptSize,
            width: 120.adaptSize,
            radius: BorderRadius.circular(
              16.h,
            ),
          ),
          Container(
            width: 155.h,
            margin: EdgeInsets.only(
              left: 8.h,
              top: 9.v,
              bottom: 14.v,
            ),
            child: Text(
              whatToDoIfA,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headlineSmall!.copyWith(
                color: appTheme.black900,
                height: 1.33,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
