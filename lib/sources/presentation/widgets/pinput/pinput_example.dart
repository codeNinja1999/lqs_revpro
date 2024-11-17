import 'package:flutter/material.dart';
import 'package:lgs_revpro/sources/core/app_core.dart';
import 'package:lgs_revpro/sources/resources/resources.dart';

import 'pinput.dart';

class PinPutExample extends StatefulWidget {
  const PinPutExample({
    super.key,
    this.onCompleted,
    this.onChanged,
    this.validator,
    this.pinController,
    this.errorTextStyle,
    this.pinTheme,
    this.formKey,
    this.pinLength,
    this.separatorBuilder,
  });

  final Function(String)? onCompleted;
  final Function(String)? onChanged;
  final TextStyle? errorTextStyle;
  final String? Function(String?)? validator;
  final TextEditingController? pinController;
  final PinTheme? pinTheme;
  final int? pinLength;
  final JustIndexedWidgetBuilder? separatorBuilder;
  final GlobalKey<FormState>? formKey;

  @override
  State<PinPutExample> createState() => _PinPutExampleState();
}

class _PinPutExampleState extends State<PinPutExample> {
  late final FocusNode focusNode;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    // pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color focusedBorderColor = theme.colorScheme.primary;
    Color fillColor = theme.colorScheme.surface;
    Color borderColor = theme.colorScheme.tertiary;

    final defaultPinTheme = PinTheme(
      width: AppSize.buttonHeight,
      height: AppSize.buttonHeight,
      textStyle: Theme.of(context).textTheme.bodyLarge,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
        border: Border.all(color: borderColor),
      ),
    );

    return Form(
      key: widget.formKey ?? _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              // You can pass your own SmsRetriever implementation based on any package
              // in this example we are using the SmartAuth
              length: widget.pinLength ?? 6,
              controller: widget.pinController,

              focusNode: focusNode,
              defaultPinTheme: widget.pinTheme ?? defaultPinTheme,
              separatorBuilder: widget.separatorBuilder ?? (index) => const SizedBox(width: 8),
              validator: widget.validator,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: widget.onCompleted,
              onChanged: widget.onChanged,
              errorTextStyle: widget.errorTextStyle ??
                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.4,
                        fontWeight: FontWeight.w400,
                        color: AppColors.errorColor,
                      ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: AppColors.errorColor.withOpacity(0.8)),
              ),
            ),
          ),
          // TextButton(
          //   onPressed: () {
          //     focusNode.unfocus();
          //     widget.formKey?.currentState!.validate();
          //   },
          //   child: Text(
          //     'Validate',
          //     style: Theme.of(context).textTheme.bodyLarge,
          //   ),
          // ),
        ],
      ),
    );
  }
}
