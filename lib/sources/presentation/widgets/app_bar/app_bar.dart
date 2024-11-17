import 'package:flutter/material.dart';
import 'package:lgs_revpro/sources/core/app_core.dart';
import 'package:lgs_revpro/sources/resources/resources.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? backButtonAction;
  final Color? backgroundColor;
  final bool allowBack;
  final List<Widget>? actions;
  final Color? arrowColor;
  final Widget? leading;
  const MyAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.backButtonAction,
    this.allowBack = true,
    this.actions,
    this.arrowColor,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: Theme.of(context).colorScheme.shadow,
      leading: allowBack
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: arrowColor ?? Colors.black,
                size: AppSize.viewSpacing,
              ),
              color: AppColors.black,
              onPressed: () {
                if (FocusScope.of(context).hasFocus) {
                  FocusScope.of(context).requestFocus(FocusNode());
                }
                (backButtonAction != null) ? backButtonAction!() : Navigator.of(context).pop();
              },
            )
          : leading,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      centerTitle: true,
      title: Text(
        title ?? "",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      elevation: 0,
      iconTheme: Theme.of(context).iconTheme,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
