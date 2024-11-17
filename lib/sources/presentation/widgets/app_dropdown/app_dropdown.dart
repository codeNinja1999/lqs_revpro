import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lgs_revpro/sources/core/app_core.dart';
import 'package:lgs_revpro/sources/resources/resources.dart';

T? tryCast<T>(dynamic object) => object is T ? object : null;

enum DropdownType { menu, bottomSheet, dialog, modalBottomSheet }

class AppDropDown<T> extends StatefulWidget {
  const AppDropDown({
    super.key,
    this.title,
    this.textStyle,
    this.iconColor,
    this.titleColor,
    this.cornerRadius = AppSize.cornerRadiusMedium,
    this.items,
    this.selectedItem,
    this.enableSearch = true,
    this.dropdownType = DropdownType.modalBottomSheet,
    this.placeholder,
    this.onChanged,
    this.imageUrl,
    this.leadingIcon,
    this.validator,
    this.onFind,
    this.textController,
    this.enabled,
    this.fillColor,
    this.leadingInitial = false,
    this.urlI = AppConstants.countryImageUrl,
    this.isCountry,
    this.prefix,
    this.prefixIcon,
    this.focusNode,
    this.onPressed,
    this.onBeforePopupOpening,
    this.prefixIconConstraints,
  });
  final String? title;
  final TextStyle? textStyle;
  final Color? iconColor;
  final Color? titleColor;
  final double cornerRadius;
  final FocusNode? focusNode;
  final void Function(T)? onChanged;
  final DropdownType? dropdownType;
  final List<T>? items;
  final T? selectedItem;
  final bool enableSearch;
  final String? placeholder;
  final String? urlI;
  final IconData? leadingIcon;
  final String? imageUrl;
  final String? Function(T?)? validator;
  final Future<List<T>> Function(String?)? onFind;
  final bool? enabled;
  final bool? isCountry;
  final Color? fillColor;
  final TextEditingController? textController;
  final bool? leadingInitial;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Function()? onPressed;
  final Future<bool> Function(T?)? onBeforePopupOpening;
  final BoxConstraints? prefixIconConstraints;

  @override
  State<AppDropDown<T>> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<T> extends State<AppDropDown<T>> {
  String getInitials(String title) =>
      title.isNotEmpty ? title.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join() : '';

  Color getColorForName(String name) {
    // You can use a hash function to generate a unique color based on the name.
    int hash = utf8.encode(name).fold(0, (int result, int current) {
      return result + current;
    });

    // Use the hash value to determine the color.
    return Colors.primaries[hash % Colors.primaries.length].withOpacity(0.6);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      if (widget.title != null && widget.title!.isNotEmpty) ...[
        Text(
          widget.title ?? '',
          style: widget.titleColor != null ? theme.textTheme.bodyLarge?.copyWith() : theme.textTheme.bodyLarge,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: AppSize.cornerRadiusMedium),
      ],
      Theme(
        data: theme.copyWith(
          splashColor: theme.colorScheme.shadow,
          highlightColor: theme.colorScheme.shadow,
        ),
        child: IgnorePointer(
          ignoring: widget.items == null ? true : false,
          child: DropdownSearch<T>(
            autoValidateMode: AutovalidateMode.onUserInteraction,
            enabled: widget.enabled ?? true,
            onBeforePopupOpening: widget.onBeforePopupOpening,
            dropdownButtonProps: DropdownButtonProps(
              focusNode: widget.focusNode,
              onPressed: widget.onPressed,
              icon: widget.items == null
                  ? CupertinoActivityIndicator(color: theme.indicatorColor)
                  : widget.iconColor != null
                      ? Icon(Icons.keyboard_arrow_down_outlined, color: widget.iconColor)
                      : Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.placeholder),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              textAlign: TextAlign.left,
              textAlignVertical: TextAlignVertical.center,
              baseStyle: (widget.textStyle != null)
                  ? widget.textStyle
                  : theme.textTheme.bodyLarge?.copyWith(textBaseline: TextBaseline.alphabetic),
              dropdownSearchDecoration: InputDecoration(
                hintText: widget.placeholder ?? '',
                prefix: widget.prefix,
                prefixIcon: widget.prefixIcon,
                prefixIconConstraints: widget.prefixIconConstraints,
                hintStyle: TextStyle(color: AppColors.placeholder),
                counterText: "",
                fillColor: widget.fillColor ?? Theme.of(context).colorScheme.surface,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSize.inset,
                  vertical: AppSize.cornerRadiusMedium,
                ),
                errorStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.error,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
                  borderSide: BorderSide(color: AppColors.textBorderColor),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
                  borderSide: BorderSide(color: AppColors.textBorderColor.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
                  borderSide: BorderSide(color: AppColors.textBorderColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
                  borderSide: BorderSide(color: AppColors.textBorderColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
                  borderSide: BorderSide(color: theme.colorScheme.error),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
                  borderSide: BorderSide(color: theme.colorScheme.error),
                ),
              ),
            ),
            popupProps: popupProps(theme),
            items: widget.items ?? [],
            selectedItem: widget.selectedItem,
            onChanged: (data) {
              if (widget.onChanged != null) {
                _formKey.currentState?.validate();
                widget.onChanged!(data as T);
              }
            },
            validator: widget.validator,
          ),
        ),
      ),
    ]);
  }

  PopupProps<T> popupProps(ThemeData theme) {
    if (widget.dropdownType == DropdownType.menu) {
      return PopupPropsMultiSelection.menu(
        fit: FlexFit.loose,
        menuProps: MenuProps(
          backgroundColor: theme.colorScheme.surface,
          elevation: 5,
          shadowColor: AppColors.black,
          barrierColor: Colors.black12,
        ),
        searchDelay: const Duration(milliseconds: 1),
        itemBuilder: (context, item, isSelected) {
          return Text(item.toString(), style: theme.textTheme.titleMedium);
        },
        showSearchBox: widget.enableSearch,
        searchFieldProps: TextFieldProps(
          style: theme.textTheme.bodyMedium,
          padding: const EdgeInsets.only(
            top: AppSize.viewSpacing,
            left: AppSize.viewMargin,
            right: AppSize.viewMargin,
          ),
          cursorColor: theme.primaryColor,
          decoration: InputDecoration(
            hintText: LocaleKeys.searchTitle.value,
            hintStyle: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400, color: AppColors.textColor7),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: AppSize.inset),
              child: SvgPicture.asset(
                AppSvg.search,
                fit: BoxFit.scaleDown,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSize.inset,
              vertical: AppSize.cornerRadiusMedium,
            ),
            errorStyle: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.error),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: theme.colorScheme.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: theme.colorScheme.error),
            ),
          ),
        ),
        listViewProps: const ListViewProps(
          padding: EdgeInsets.only(
            top: AppSize.inset,
            left: AppSize.viewMargin,
            right: AppSize.viewMargin,
          ),
        ),
      );
    } else if (widget.dropdownType == DropdownType.bottomSheet) {
      return PopupPropsMultiSelection.bottomSheet(
        fit: FlexFit.tight,
        searchDelay: const Duration(milliseconds: 1),
        itemBuilder: (context, item, isSelected) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(item.toString(), style: theme.textTheme.titleSmall),
              Divider(color: theme.dividerColor),
            ],
          );
        },
        bottomSheetProps: BottomSheetProps(
          backgroundColor: theme.colorScheme.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.inset),
              topRight: Radius.circular(AppSize.inset),
            ),
          ),
          constraints: const BoxConstraints(
            maxWidth: double.infinity,
          ),
          clipBehavior: Clip.antiAlias,
        ),
        showSearchBox: widget.enableSearch,
        searchFieldProps: TextFieldProps(
          style: theme.textTheme.bodyMedium,
          padding: const EdgeInsets.only(
            top: AppSize.viewSpacing,
            left: AppSize.viewMargin,
            right: AppSize.viewMargin,
          ),
          cursorColor: theme.primaryColor,
          decoration: InputDecoration(
            hintText: LocaleKeys.searchTitle.value,
            hintStyle: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400, color: AppColors.textColor7),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: AppSize.inset),
              child: SvgPicture.asset(
                AppSvg.search,
                fit: BoxFit.scaleDown,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.inset, vertical: AppSize.cornerRadiusMedium),
            errorStyle: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.error),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.cornerRadiusSmall),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.cornerRadiusSmall),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.cornerRadiusSmall),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.cornerRadiusSmall),
              borderSide: BorderSide(color: theme.colorScheme.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
              borderSide: BorderSide(color: theme.colorScheme.error),
            ),
          ),
        ),
        listViewProps: const ListViewProps(
          padding: EdgeInsets.only(
            top: AppSize.inset,
            left: AppSize.viewMargin,
            right: AppSize.viewMargin,
          ),
        ),
      );
    } else if (widget.dropdownType == DropdownType.modalBottomSheet) {
      return PopupPropsMultiSelection.modalBottomSheet(
        showSearchBox: true,
        modalBottomSheetProps: ModalBottomSheetProps(
          backgroundColor: theme.colorScheme.surface,
        ),
        searchDelay: const Duration(milliseconds: 1),
        searchFieldProps: TextFieldProps(
          style: theme.textTheme.bodyMedium,
          padding: const EdgeInsets.only(
            top: AppSize.viewSpacing,
            left: AppSize.viewMargin,
            right: AppSize.viewMargin,
          ),
          cursorColor: theme.primaryColor,
          decoration: InputDecoration(
            hintText: LocaleKeys.searchTitle.value,
            hintStyle: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400, color: AppColors.textColor7),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: AppSize.inset),
              child: SvgPicture.asset(
                AppSvg.search,
                fit: BoxFit.scaleDown,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.inset, vertical: AppSize.cornerRadiusMedium),
            errorStyle: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.error),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
          ),
        ),
        itemBuilder: (context, item, a) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(item.toString(), style: theme.textTheme.titleSmall),
              Divider(color: theme.dividerColor),
            ],
          );
        },
        listViewProps: const ListViewProps(
          padding: EdgeInsets.only(
            top: AppSize.inset,
            left: AppSize.viewMargin,
            right: AppSize.viewMargin,
          ),
        ),
      );
    } else {
      return PopupPropsMultiSelection.dialog(
        showSearchBox: true,
        searchDelay: const Duration(milliseconds: 1),
        searchFieldProps: TextFieldProps(
          style: theme.textTheme.bodyMedium,
          padding: const EdgeInsets.only(
            top: AppSize.viewSpacing,
            left: AppSize.viewMargin,
            right: AppSize.viewMargin,
          ),
          cursorColor: theme.primaryColor,
          decoration: InputDecoration(
            hintText: LocaleKeys.searchTitle.value,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, color: AppColors.textColor7),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: AppSize.inset),
              child: SvgPicture.asset(
                AppSvg.search,
                fit: BoxFit.scaleDown,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.inset, vertical: AppSize.cornerRadiusMedium),
            errorStyle: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.error),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: theme.colorScheme.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.viewSpacing)),
              borderSide: BorderSide(color: theme.colorScheme.error),
            ),
          ),
        ),
        itemBuilder: (context, item, a) {
          final data = item.toString();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data, style: theme.textTheme.titleSmall),
              Divider(color: theme.dividerColor.withOpacity(0.5)),
            ],
          );
        },
        listViewProps: const ListViewProps(
          padding: EdgeInsets.only(
            top: AppSize.inset,
            left: AppSize.viewMargin,
            right: AppSize.viewMargin,
          ),
        ),
      );
    }
  }
}
