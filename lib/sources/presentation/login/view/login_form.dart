import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lgs_revpro/sources/route/route.dart';
import 'package:lgs_revpro/sources/core/app_core.dart';
import 'package:lgs_revpro/sources/presentation/widgets/widgets.dart';
import '../bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        final status = state.status;
        (status is InProgress) ? LoadingView.show() : LoadingView.hide();
        if (status is Success) {
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: AppSize.inset),
                      child: Text(
                        "Login",
                        style: theme.textTheme.titleMedium?.copyWith(fontSize: 36),
                      ),
                    ),
                    const SizedBox(height: AppSize.viewSpacing),
                    UserNameInput(textController: textController),
                    const SizedBox(height: AppSize.inset),
                    _PasswordInput(),
                    const SizedBox(height: AppSize.inset),
                    const RememberView(),
                    const SizedBox(height: AppSize.viewSpacing * 2),
                    CustomButton(
                      title: "Log in",
                      onPressed: () {
                        KeyboardUtil.hideKeyboard(context);
                        Navigator.of(context).pushReplacementNamed(AppRoute.dashboard);
                      },
                    ),
                    const SizedBox(height: AppSize.inset),
                  ],
                ),
              ),
              _FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSize.viewSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            CreateAccountView(),
          ],
        ),
      ),
    );
  }
}

class UserNameInput extends StatelessWidget {
  const UserNameInput({super.key, required this.textController});
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.persistUsername != current.persistUsername,
      listener: (context, state) {
        textController.text = state.persistUsername;
        textController.selection = TextSelection.collapsed(offset: state.persistUsername.length);
      },
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return AppTextfield(
          controller: textController,
          maxLength: 254,
          title: LocaleKeys.emailAddressTitle.value,
          placeHolder: LocaleKeys.emailAddressPlaceholder.value,
          validator: (_) => state.usernameValidation,
          onChanged: (username) {
            context.read<LoginBloc>().add(UsernameNumberChanged(username));
          },
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return AppTextfield(
          obscureSign: "•",
          title: LocaleKeys.passwordTitle.value,
          placeHolder: LocaleKeys.enterPassword.value,
          isObscure: true,
          textInputType: TextInputType.visiblePassword,
          validator: (_) => state.passwordValidation,
          onChanged: (password) {
            context.read<LoginBloc>().add(PasswordChanged(password));
          },
        );
      },
    );
  }
}

class RememberView extends StatelessWidget {
  const RememberView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.isRememberMe != current.isRememberMe,
      builder: (context, state) {
        return Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    height: AppSize.checkBoxHeight,
                    width: AppSize.checkBoxHeight,
                    child: Checkbox(
                      side: WidgetStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.grey),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      checkColor: Colors.black,
                      fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                        return Colors.white;
                      }),
                      value: state.isRememberMe,
                      onChanged: (_) => context.read<LoginBloc>().add(RememberMe()),
                    ),
                  ),
                  const SizedBox(width: AppSize.cornerRadiusMedium),
                  Text(
                    LocaleKeys.rememberMe.value,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.pushNamed(context, AppRoute.forgotPassword);
            //     },
            //     child: Text(
            //       LocaleKeys.forgotPassword.value,
            //       textAlign: TextAlign.end,
            //       style: theme.textTheme.titleMedium?.copyWith(
            //         decoration: TextDecoration.underline,
            //         color: theme.colorScheme.primary,
            //         fontWeight: FontWeight.w400,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Flexible(
        //   child: Text(
        //     LocaleKeys.notHaveAnOptions.value,
        //     style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
        //     maxLines: 2,
        //     softWrap: true,
        //     textAlign: TextAlign.center,
        //   ),
        // ),
        // const SizedBox(width: AppSize.cornerRadiusMedium),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoute.registerPage);
          },
          child: Text(
            LocaleKeys.signUp.value,
            style: theme.textTheme.titleMedium?.copyWith(
              decoration: TextDecoration.underline,
              color: theme.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
