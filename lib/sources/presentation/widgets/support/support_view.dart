import 'package:lgs_revpro/sources/resources/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lgs_revpro/sources/core/app_core.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key, this.onSupport});
  final VoidCallback? onSupport;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.cornerRadius - 4),
        side: BorderSide(color: theme.dividerColor),
      ),
      child: ListTile(
        onTap: onSupport,
        contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.inset, vertical: AppSize.cornerRadiusSmall),
        minLeadingWidth: 0,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: AppSize.inset),
          child: Image.asset(
            AppImages.call,
            height: 18,
            width: 18,
          ),
        ),
        dense: true,
        title: Text(
          "24x7 Help & Support",
          style: theme.textTheme.titleSmall,
        ),
        subtitle: Text(
          "Get quick solutions for queries.",
          style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
