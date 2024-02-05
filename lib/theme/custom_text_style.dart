import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Headline text style
  static get headlineSmallGray800 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray800,
      );
  // Label text style
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
      );
  static get labelLargeGray900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray900,
      );
  static get labelLargeGray900Bold => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumWhiteA700 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get labelMediumWhiteA700Bold => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  // Pacifico text style
  static get pacificoLightblueA700 => TextStyle(
        color: appTheme.lightBlueA700,
        fontSize: 96.fSize,
        fontWeight: FontWeight.w400,
      ).pacifico;
  // Title text style
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get pacifico {
    return copyWith(
      fontFamily: 'Pacifico',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}
