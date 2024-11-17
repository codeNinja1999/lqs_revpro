import 'package:flutter/material.dart';

import 'package:lgs_revpro/sources/core/app_core.dart';
import 'package:lgs_revpro/sources/presentation/widgets/widgets.dart';
import 'package:lgs_revpro/sources/resources/resources.dart';

class DividerButton extends StatelessWidget {
  const DividerButton({
    super.key,
    this.backTitle,
    this.backButtonAction,
    this.nextTitle,
    this.isEnabled = true,
    required this.nextButtonAction,
  });

  final String? backTitle;
  final Function()? backButtonAction;
  final String? nextTitle;
  final bool isEnabled;
  final Function()? nextButtonAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          color: AppColors.textColor3,
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.inset, vertical: AppSize.viewSpacing),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              (backTitle != null)
                  ? DefaultBackButtonAction(backTitle: backTitle, backButtonAction: backButtonAction)
                  : Container(),
              Expanded(
                child: CustomButton(
                  isEnabled: isEnabled,
                  title: nextTitle ?? LocaleKeys.continueTitle.value,
                  onPressed: isEnabled
                      ? () {
                          KeyboardUtil.hideKeyboard(context);
                          nextButtonAction!();
                        }
                      : null,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class DefaultBackButtonAction extends StatelessWidget {
  const DefaultBackButtonAction({
    super.key,
    required this.backTitle,
    required this.backButtonAction,
  });

  final String? backTitle;
  final Function()? backButtonAction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              title: backTitle!,
              onPressed: (backButtonAction != null)
                  ? backButtonAction
                  : () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                              svgImage: AppSvg.cancel,
                              title: LocaleKeys.cancelTransaction.value,
                              message: LocaleKeys.areYouSureYouWantToCancelThisTransaction.value,
                              primaryButtonTitle: LocaleKeys.yesCancel.value,
                              secondaryButtonTitle: LocaleKeys.noIWantToContinue.value,
                              onPrimaryButtonPressed: backButtonAction ??
                                  () {
                                    Navigator.of(context).pop();
                                  });
                        },
                      );
                    },
              buttonType: ButtonType.bordered,
            ),
          ),
          const SizedBox(width: AppSize.inset * 0.5),
        ],
      ),
    );
  }
}
