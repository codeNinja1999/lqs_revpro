import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lgs_revpro/sources/core/app_core.dart';
import 'package:lgs_revpro/sources/presentation/widgets/widgets.dart';

import '../../../route/registration_route.dart';
import '../bloc/set_pin_bloc.dart';

class SetPinPage extends StatefulWidget {
  const SetPinPage({super.key});

  @override
  State<SetPinPage> createState() => _SetPinPageState();
}

class _SetPinPageState extends State<SetPinPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: const MyAppBar(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(color: theme.disabledColor),
          BlocBuilder<SetPinBloc, SetPinState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSize.viewMargin,
                  horizontal: AppSize.inset,
                ),
                child: CustomButton(
                  title: LocaleKeys.nextButtonTitle.value,
                  buttonType: ButtonType.round,
                  onPressed: () {
                    KeyboardUtil.hideKeyboard(context);
                    Navigator.of(context).pushNamed(RegistrationRoute.confirmPin);
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: const SetPinBody(),
    );
  }
}

class SetPinBody extends StatefulWidget {
  const SetPinBody({super.key});

  @override
  State<SetPinBody> createState() => _SetPinBodyState();
}

class _SetPinBodyState extends State<SetPinBody> {
  var formKey = GlobalKey<FormState>();
  String code = "";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<SetPinBloc, SetPinState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: AppSize.viewMargin,
            horizontal: AppSize.inset,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: AppSize.inset),
                  child: Text(
                    LocaleKeys.setupTransactionPin.value,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 36),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppSize.viewSpacing,
                    bottom: AppSize.inset,
                  ),
                  child: Text(
                    LocaleKeys.enterTransactionPin.value,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                const OtpNumberBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
