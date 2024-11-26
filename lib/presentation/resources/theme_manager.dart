import 'package:clean_architector_with_mvvm_getx/presentation/resources/color_manager.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/resources/font_manager.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'style_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(

      //main colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      //ripple color
      splashColor: ColorManager.primaryOpacity70,
      ////will be used incase of disable for example

      //card view theme
      cardTheme: CardTheme(
        color: ColorManager.whte,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      ),
      //App bar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
      ),
      //elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontFamily: FontConstants.fontFamily,
              color: ColorManager.whte,
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12))),
      ),
      //Text them
      textTheme: TextTheme(
        headlineSmall: getSemiBoldStyle(color: ColorManager.dartGrey, fontSize: FontSize.s16),
        titleMedium: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
    
      ),
      //input decoration theme ( text form field)
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: getRegularStyle(color: ColorManager.grey1),

        //label style
        labelStyle: getMediumStyle(color: ColorManager.dartGrey),

        //error style
        errorStyle: getRegularStyle(color: ColorManager.error),

        //enabel border
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),

        //focus border
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),

        //error border
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),

        //focus error border
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
      ));
}
