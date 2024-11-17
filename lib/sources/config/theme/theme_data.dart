import 'package:lgs_revpro/sources/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lgs_revpro/sources/core/app_size/app_size.dart';

final ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: Colors.blueAccent.withOpacity(0.5),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: AppColors.bottomApBarColor,
    surfaceTintColor: Colors.transparent,
  ),
  colorScheme: ColorScheme.light(
    shadow: Colors.transparent,
    brightness: Brightness.light,
    primary: AppColors.primary,
    primaryFixed: AppColors.primaryDeep,
    onPrimary: AppColors.backgroundLight,
    error: AppColors.errorColor,
    secondary: AppColors.secondary,
    surface: AppColors.backgroundLight,
    outline: AppColors.outlineColor,
    outlineVariant: AppColors.outlineVariantColor,
    tertiary: AppColors.moderatePrimary,
    secondaryContainer: AppColors.lightPrimary,
  ),
  appBarTheme: AppBarTheme(
    // systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: AppColors.backgroundLight,
    surfaceTintColor: Colors.transparent,
  ),
  primaryColor: AppColors.primary,
  indicatorColor: AppColors.indicatorColorLight,
  shadowColor: Colors.transparent,
  dividerColor: AppColors.dividerColor,
  disabledColor: AppColors.disabledColor,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColors.backgroundLight,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.cornerRadius)),
    ),
  ),
  unselectedWidgetColor: AppColors.search,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.fillColorLight,
    focusColor: AppColors.primary,
  ),
  cardTheme: CardTheme(
    color: AppColors.primary,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.inset),
      side: BorderSide.none,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      backgroundColor: WidgetStateProperty.all<Color?>(Colors.transparent),
      foregroundColor: WidgetStateProperty.all<Color?>(AppColors.backgroundLight),
      overlayColor: WidgetStateProperty.all<Color?>(Colors.transparent),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateColor.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        } else {
          return AppColors.iconColorLight;
        }
      },
    ),
  ),
  iconTheme: IconThemeData(color: AppColors.iconColorLight),
  listTileTheme: ListTileThemeData(iconColor: AppColors.iconColorLight),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      color: AppColors.textColor,
      fontSize: 20,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
      fontSize: 14,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      fontSize: 14,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      fontSize: 12,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      fontSize: 11,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      fontSize: 12,
    ),
  ),
);

final ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: Colors.blueAccent.withOpacity(0.5),
  ),
  colorScheme: ColorScheme.dark(
    surface: AppColors.primaryDark,
    primary: AppColors.primary,
    error: AppColors.errorColor,
    outline: AppColors.outlineColor,
    outlineVariant: AppColors.outlineVariantColor,
    tertiary: AppColors.moderatePrimary,
    secondaryContainer: AppColors.lightPrimary,
  ),
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.primaryDark,
  indicatorColor: AppColors.indicatorColorDark,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColors.backgroundLightDark,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.cornerRadius)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.backgroundLightDark,
    focusColor: AppColors.primary,
  ),
  cardTheme: CardTheme(
    color: AppColors.primary,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.inset),
      side: BorderSide.none,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
        return const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 16);
      }),
      padding: WidgetStateProperty.all<EdgeInsets>(
        const EdgeInsets.fromLTRB(12, 12, 12, 12),
      ),
      backgroundColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.primary.withOpacity(0.38);
          }
          return AppColors.primary;
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.white.withOpacity(0.38);
          }
          return Colors.white;
        },
      ),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateColor.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        } else {
          return AppColors.iconColorDark;
        }
      },
    ),
  ),
  chipTheme: ChipThemeData(selectedColor: AppColors.backgroundLightDark),
  listTileTheme: ListTileThemeData(iconColor: AppColors.iconColorDark),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 20,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 14,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 14,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 12,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 11,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontSize: 12,
    ),
  ),
);

extension CustomStyles on TextTheme {
  get error => (BuildContext context) => TextStyle(
        fontSize: 14.0,
        color: Theme.of(context).colorScheme.error,
        fontWeight: FontWeight.normal,
      );

  get placeHolder => (BuildContext context) => TextStyle(
        fontSize: 12.0,
        fontFamily: "Roboto",
        color: (Theme.of(context).brightness == Brightness.dark) ? Colors.white : AppColors.textColor,
        fontWeight: FontWeight.normal,
      );
}
