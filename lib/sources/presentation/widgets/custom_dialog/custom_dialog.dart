import 'package:lgs_revpro/sources/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lgs_revpro/sources/core/app_core.dart';
import 'package:lgs_revpro/sources/presentation/widgets/widgets.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    this.imageString,
    this.svgImage,
    this.secondaryButtonType = ButtonType.plain,
    this.tertiaryButtonType = ButtonType.plain,
    required this.message,
    this.subMessage,
    required this.primaryButtonTitle,
    this.secondaryButtonTitle,
    this.tertiaryButtonTitle,
    this.horizontalPadding,
    required this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.tertiaryTitleStyle,
    this.onTertiaryButtonButtonPressed,
  });

  final String title;
  final String? imageString;
  final String? svgImage;
  final String message;
  final String? subMessage;

  final String primaryButtonTitle;
  final ButtonType secondaryButtonType;
  final ButtonType tertiaryButtonType;
  final double? horizontalPadding;
  final String? secondaryButtonTitle;
  final String? tertiaryButtonTitle;
  final TextStyle? tertiaryTitleStyle;
  final Function() onPrimaryButtonPressed;
  final Function()? onTertiaryButtonButtonPressed;
  final Function()? onSecondaryButtonPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tertiaryTitleStyle = this.tertiaryTitleStyle ??
        Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, decoration: TextDecoration.underline);
    return Center(
      child: Container(
        padding: const EdgeInsetsDirectional.only(
          top: AppSize.spacedViewSpacing,
          bottom: AppSize.spacedViewSpacing,
          start: AppSize.inset,
          end: AppSize.inset,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.cornerRadius),
          color: theme.colorScheme.surface,
        ),
        width: MediaQuery.of(context).size.width - (AppSize.viewMargin * 2),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (subMessage == null) ...[
                CircleAvatar(
                  radius: 50,
                  backgroundColor: theme.colorScheme.shadow,
                  child: (imageString != null)
                      ? Image.asset(imageString ?? AppImages.dashboardCard, fit: BoxFit.contain)
                      : SvgPicture.asset(svgImage ?? AppSvg.receiptSuccess, fit: BoxFit.contain),
                ),
                const SizedBox(height: AppSize.inset * 1.25),
              ],
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: AppSize.inset * 0.75),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.cornerRadiusMedium,
                ),
                child: Column(
                  children: [
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge,
                    ),
                    if (subMessage != null) ...[
                      SizedBox(
                        height: AppSize.inset,
                      ),
                      Text(
                        subMessage ?? "",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ]
                  ],
                ),
              ),
              const SizedBox(height: AppSize.inset * 1.25),
              CustomButton(
                title: primaryButtonTitle,
                onPressed: () {
                  Navigator.of(context).pop();
                  onPrimaryButtonPressed();
                },
              ),
              (secondaryButtonTitle != null)
                  ? Padding(
                      padding: const EdgeInsets.only(top: AppSize.inset),
                      child: CustomButton(
                        buttonType: secondaryButtonType,
                        title: secondaryButtonTitle!,
                        horizontalPadding: horizontalPadding,
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (onSecondaryButtonPressed != null) {
                            onSecondaryButtonPressed!();
                          }
                        },
                      ),
                    )
                  : Container(),
              (tertiaryButtonTitle != null)
                  ? Padding(
                      padding: const EdgeInsets.only(top: AppSize.inset * 1.25),
                      child: CustomButton(
                        buttonType: tertiaryButtonType,
                        title: tertiaryButtonTitle!,
                        titleStyle: tertiaryTitleStyle,
                        horizontalPadding: horizontalPadding,
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (onTertiaryButtonButtonPressed != null) {
                            onTertiaryButtonButtonPressed!();
                          }
                        },
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
