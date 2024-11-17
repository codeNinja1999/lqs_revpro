import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lgs_revpro/sources/core/app_core.dart';
import 'package:lgs_revpro/sources/resources/resources.dart';
import 'package:lgs_revpro/sources/presentation/widgets/widgets.dart';

import '../bloc/register_form_bloc.dart';
import '../widgets/password_rule_view.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();
  final dobDateEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    dobDateEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterFormBloc, RegisterFormState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        final status = state.status;
        (status is InProgress) ? LoadingView.show() : LoadingView.hide();
        if (status is Success) {
          _showSuccessDialog();
        } else if (status is SubmissionFailure) {}
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.viewMargin),
        child: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSize.spacedViewSpacing),
                    Text(
                      LocaleKeys.tellUsAboutYourself.value,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: AppSize.inset * 2),
                    ),
                    const SizedBox(height: AppSize.viewMargin),
                    const FullNameInput(),
                    const SizedBox(height: AppSize.inset),
                    DateOfBirthInput(dobDateEditingController: dobDateEditingController),
                    const SizedBox(height: AppSize.inset),
                    AppTextfield(
                      title: "Sex",
                    ),
                    const SizedBox(height: AppSize.inset),
                    AppTextfield(
                      title: LocaleKeys.addressTitle.value,
                    ),
                    const SizedBox(height: AppSize.inset),
                    AppTextfield(
                      title: "Occupation",
                    ),
                    const SizedBox(height: AppSize.inset),
                    const PasswordInput(),
                    const SizedBox(height: AppSize.inset),
                    const ConfirmPasswordInput(),
                    const SizedBox(height: AppSize.inset),
                    const PasswordRulView(),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppSize.viewSpacing),
                        child: CustomButton(
                            title: LocaleKeys.register.value,
                            onPressed: () {
                              KeyboardUtil.hideKeyboard(context);
                              Navigator.of(context, rootNavigator: true).pop();
                              // if (formKey.currentState!.validate()) {
                              // final mainState = context.read<NewMemberBloc>().state;
                              // context.read<RegisterFormBloc>().add(
                              //       RegisterUser(
                              //         username: mainState.userName,
                              //         processId: mainState.registerProcessID,
                              //       ),
                              //     );
                              // }
                            })),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (newContext) {
        return PopScope(
          canPop: false,
          child: CustomDialog(
            imageString: AppImages.registeredPhone,
            title: LocaleKeys.registerSuccessful.value,
            message: LocaleKeys.yourAccountHasBeenRegisteredSuccessfully.value,
            primaryButtonTitle: LocaleKeys.logIn.value,
            onPrimaryButtonPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        );
      },
    );
  }
}

class FullNameInput extends StatelessWidget {
  const FullNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
      buildWhen: (previous, current) => previous.fullName != current.fullName,
      builder: (context, state) {
        return AppTextfield(
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
          title: "${LocaleKeys.fullName.value}*",
          textCapitalization: TextCapitalization.words,
          placeHolder: LocaleKeys.enterFullName.value,
          textInputType: TextInputType.name,
          onChanged: (fullName) {
            context.read<RegisterFormBloc>().add(FullNameChanged(fullName));
          },
        );
      },
    );
  }
}

class MobileNumberInput extends StatelessWidget {
  const MobileNumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
      buildWhen: (previous, current) => previous.mobileNumber != current.mobileNumber,
      builder: (context, state) {
        return AppTextfield(
          maxLength: 11,
          title: LocaleKeys.phoneNumberTitle.value,
          placeHolder: LocaleKeys.phoneNumberTitle.value,
          validator: (_) => state.phoneNumberValidation,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (mobileNumber) {
            context.read<RegisterFormBloc>().add(MobileChanged(mobileNumber));
          },
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return AppTextfield(
          textInputType: TextInputType.text,
          isObscure: true,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny whitespace characters
          ],
          title: LocaleKeys.passwordTitle.value,
          placeHolder: LocaleKeys.enterPassword.value,
          // validator: (_) => state.passwordValidation,
          onChanged: (password) {
            context.read<RegisterFormBloc>().add(PasswordChanged(password));
          },
        );
      },
    );
  }
}

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
      buildWhen: (previous, current) => previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return AppTextfield(
          textInputType: TextInputType.text,
          isObscure: true,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny whitespace characters
          ],
          title: LocaleKeys.confirmPassword.value,
          placeHolder: LocaleKeys.confirmPasswordPlaceholder.value,
          // validator: (_) => state.confirmPasswordValidation,
          onChanged: (confirmPassword) {
            context.read<RegisterFormBloc>().add(ConfirmPasswordChanged(confirmPassword));
          },
        );
      },
    );
  }
}

class DateOfBirthInput extends StatelessWidget {
  const DateOfBirthInput({super.key, required this.dobDateEditingController});
  final TextEditingController dobDateEditingController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
      buildWhen: (previous, current) => previous.dateOfBirth != current.dateOfBirth,
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            final datePicked = await openDatePicker(
                context: context,
                minimumYear: 18,
                date: (state.dateOfBirth != "") ? DateTime.parse(state.dateOfBirth) : null);
            if (datePicked != null) {
              final dobDate = DateFormat('yyyy-MM-dd').format(datePicked);

              if (context.mounted) {
                context.read<RegisterFormBloc>().add(DateOfBirthChanged(dobDate));
                dobDateEditingController.text = dobDate;
              }
            }
          },
          child: AbsorbPointer(
            child: AppTextfield(
              title: LocaleKeys.dateOfBirthTitle.value,
              placeHolder: LocaleKeys.dateOfBirthPlaceholder.value,
              suffixIcon: const Icon(Icons.calendar_month),
              controller: dobDateEditingController,
            ),
          ),
        );
      },
    );
  }
}
