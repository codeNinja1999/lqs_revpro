import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lgs_revpro/sources/core/app_core.dart';
import 'package:lgs_revpro/sources/presentation/widgets/widgets.dart';

import '../../../route/registration_route.dart';
import '../bloc/account_otp_verify_bloc.dart';

class OtpVerifyForm extends StatefulWidget {
  const OtpVerifyForm({super.key});

  @override
  State<OtpVerifyForm> createState() => _OtpVerifyFormState();
}

class _OtpVerifyFormState extends State<OtpVerifyForm> {
  var formKey = GlobalKey<FormState>();

  String strDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppSize.viewMargin),
      child: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: AppSize.viewMargin),
                  Text(LocaleKeys.verificationCode.value, style: theme.textTheme.titleMedium?.copyWith(fontSize: 36)),
                  const SizedBox(height: AppSize.viewSpacing),
                  PinPutExample(
                    onChanged: (pin) => context.read<AccountOtpVerifyBloc>().add(VerificationCodeChanged(pin)),
                  ),
                  const SizedBox(height: AppSize.inset),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  const SizedBox(height: AppSize.spacedViewSpacing),
                  BlocBuilder<AccountOtpVerifyBloc, AccountOtpVerifyState>(
                    buildWhen: (previous, current) => previous.resendDuration != current.resendDuration,
                    builder: (context, state) {
                      return (state.resendDuration.inSeconds) >= 0
                          ? RichText(
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.visible,
                              text: TextSpan(
                                text: LocaleKeys.didNotGeTheCodeResendIn.value,
                                style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(
                                    text:
                                        "${strDigits(state.resendDuration.inMinutes.remainder(60))}:${strDigits(state.resendDuration.inSeconds.remainder(60))}",
                                    style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.error),
                                  ),
                                ],
                              ),
                            )
                          : RichText(
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.visible,
                              text: TextSpan(
                                text: LocaleKeys.didNotGeTheCode.value,
                                style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(
                                    text: LocaleKeys.resendOtp.value,
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      color: theme.colorScheme.error,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // final mainState = context.read<NewMemberBloc>().state;
                                        // context.read<AccountOtpVerifyBloc>().add(
                                        //       ResendOtp(emailAddress: mainState.emailAddress),
                                        //     );
                                      },
                                  ),
                                ],
                              ),
                            );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSize.viewSpacing),
                    child: CustomButton(
                      title: LocaleKeys.nextButtonTitle.value,
                      onPressed: () {
                        KeyboardUtil.hideKeyboard(context);
                        Navigator.of(context).pushNamed(RegistrationRoute.registerForm);
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
