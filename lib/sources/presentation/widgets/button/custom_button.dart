import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lgs_revpro/sources/core/app_core.dart';
import 'package:lgs_revpro/sources/resources/resources.dart';

enum ButtonType { primary, bordered, plain, round }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
    this.buttonType = ButtonType.primary,
    this.width,
    this.isEnabled = true,
    this.backgroundColor,
    this.borderColor,
    this.gradientColors,
    this.leadingIcon,
    this.shadowColor,
    this.cornerRadius,
    this.titleColor,
    this.shapeBorder,
    this.padding,
    this.foreGroundColor,
    this.titleStyle,
    this.horizontalPadding,
    this.textUnderline = false,
  });

  final String title;
  final TextStyle? titleStyle;
  final GestureTapCallback? onPressed;
  final double? height;
  final double? width;
  final IconData? leadingIcon;
  final bool isEnabled;
  final ButtonType buttonType;
  final Color? backgroundColor;
  final Color? borderColor;
  final ShapeBorder? shapeBorder;
  final List<Color>? gradientColors;
  final Color? shadowColor;
  final Color? titleColor;
  final Color? foreGroundColor;
  final double? cornerRadius;
  final EdgeInsetsGeometry? padding;
  final double? horizontalPadding;
  final bool textUnderline;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color? color = backgroundColor ?? getBackgroundColor(buttonType, isEnabled);
    final ShapeBorder? shape = shapeBorder ?? getBorder(buttonType, isEnabled);

    // final Color? color = (backgroundColor == null)
    //     ? (buttonType == ButtonType.primary)
    //         ? theme.colorScheme.primary
    //         : theme.colorScheme.surface
    //     : backgroundColor;

    final Color foregroundColor = getForegroundColor(buttonType, isEnabled);
    theme.colorScheme.primary;

    final contentPadding = padding ??
        EdgeInsets.symmetric(
          vertical: AppSize.inset,
          horizontal: horizontalPadding ?? AppSize.inset,
        );

    return Material(
      color: Colors.transparent,
      elevation: 0,
      shape: shape,
      child: CupertinoButton(
        minSize: height ?? kMinInteractiveDimensionCupertino,
        onPressed: isEnabled ? onPressed : null,
        padding: contentPadding,
        color: color,
        // disabledColor: AppColors.disableButton,
        disabledColor: color ?? CupertinoColors.quaternarySystemFill,
        borderRadius: BorderRadius.circular(cornerRadius ?? AppSize.buttonRadius),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: titleStyle ??
                Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: titleColor ?? foregroundColor,
                      fontWeight: FontWeight.w500,
                      decoration: textUnderline ? TextDecoration.underline : TextDecoration.none,
                    ),
          ),
        ),
      ),
    );
  }

  ShapeBorder? getBorder(ButtonType buttonType, bool isEnabled) {
    if (buttonType == ButtonType.bordered) {
      return RoundedRectangleBorder(
        side: BorderSide(color: isEnabled ? borderColor ?? AppColors.primary : AppColors.disableButton),
        borderRadius: BorderRadius.circular(cornerRadius ?? AppSize.buttonRadius),
      );
    } else if (buttonType == ButtonType.primary) {
      return RoundedRectangleBorder(
        side: BorderSide(color: isEnabled ? borderColor ?? AppColors.buttonBorderColor : AppColors.disableButton),
        borderRadius: BorderRadius.circular(cornerRadius ?? AppSize.buttonRadius),
      );
    } else {
      return null;
    }
  }

  Color getBackgroundColor(ButtonType buttonType, bool isEnabled) {
    if (buttonType == ButtonType.primary) {
      return isEnabled ? AppColors.primary : AppColors.disableButton;
    } else {
      return Colors.transparent;
    }
  }

  Color getForegroundColor(ButtonType buttonType, bool isEnabled) {
    if (buttonType == ButtonType.primary) {
      return AppColors.whiteColor;
    } else if (buttonType == ButtonType.bordered) {
      return isEnabled ? AppColors.primary : AppColors.disableButton;
    } else {
      return isEnabled ? AppColors.primary : AppColors.disableButton;
    }
  }
}
