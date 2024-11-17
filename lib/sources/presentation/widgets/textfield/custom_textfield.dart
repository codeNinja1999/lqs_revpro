import 'package:lgs_revpro/sources/config/config.dart';
import 'package:lgs_revpro/sources/core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:lgs_revpro/sources/resources/resources.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.inputFormatter,
    this.onTap,
    this.textInputType,
    this.textController,
    this.errorMessage,
    this.helperMessage,
    this.labelText,
    this.placeholder,
    this.maxLines,
    this.isObscure,
    this.onPressed,
    this.readOnly,
    this.maxLength,
    this.trailingIcon,
    this.leadingIcon,
    this.enabled,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.filled,
    this.onFieldSubmitted,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixWidget,
    this.textInputFormatter,
    this.autoFocus,
    this.prefixWidgetStyle,
    this.horizontalPadding,
    this.cornerRadius = AppSize.cornerRadiusMedium,
    this.textInputAction,
    super.key,
  });
  final List<TextInputFormatter>? inputFormatter;
  final Function()? onTap;
  final TextInputType? textInputType;
  final TextEditingController? textController;
  final String? errorMessage, helperMessage;
  final String? labelText;
  final String? placeholder;
  final bool? isObscure;
  final bool? readOnly;
  final double cornerRadius;
  final double? horizontalPadding;
  final GestureTapCallback? onPressed;
  final int? maxLength;
  final int? maxLines;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final bool? enabled;
  final FormFieldSetter? onChanged;
  final FormFieldSetter? onSaved;
  final FormFieldSetter? onFieldSubmitted;
  final FormFieldValidator? validator;
  final bool? filled;
  final Colors? fillColor;
  final Widget? prefixIcon;
  final TextStyle? prefixWidgetStyle;
  final Widget? prefixWidget;
  final Widget? suffixIcon;
  final bool? autoFocus;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputAction? textInputAction;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  var isSecureNow = true;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextFormField(
      textInputAction: widget.textInputAction,
      onTap: widget.onTap,
      enabled: widget.enabled ?? true,
      cursorColor: theme.primaryColor,
      keyboardType: widget.textInputType,
      style: theme.textTheme.bodyLarge,
      controller: widget.textController,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: widget.autoFocus ?? false,
      onFieldSubmitted: widget.onFieldSubmitted,
      inputFormatters: widget.inputFormatter,
      obscureText: (widget.isObscure ?? false) ? isSecureNow : false,
      decoration: InputDecoration(
        filled: widget.filled ?? true,
        fillColor: Theme.of(context).colorScheme.surface,
        counter: const Offstage(),
        labelText: widget.labelText,
        hintText: widget.placeholder,
        hintStyle: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textColor7, fontWeight: FontWeight.w400),
        helperText: widget.helperMessage,
        errorText: widget.errorMessage,
        helperStyle: theme.textTheme.bodySmall,
        labelStyle: Theme.of(context).textTheme.placeHolder(context),
        prefix: widget.prefixWidget,
        prefixStyle: widget.prefixWidgetStyle,
        prefixIcon: (widget.prefixIcon != null)
            ? widget.prefixIcon
            : widget.leadingIcon != null
                ? Icon(widget.leadingIcon)
                : null,
        suffixIcon: (widget.suffixIcon != null)
            ? widget.suffixIcon
            : widget.isObscure ?? false
                ? IconButton(
                    icon: Icon(isSecureNow ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: theme.iconTheme.color),
                    onPressed: () {
                      setState(() {
                        isSecureNow = !isSecureNow;
                      });
                    })
                : widget.trailingIcon != null
                    ? Icon(widget.trailingIcon)
                    : null,
        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding ?? AppSize.inset,
          vertical: AppSize.cornerRadiusMedium,
        ),
        errorStyle: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          borderSide: BorderSide(color: theme.colorScheme.error, width: 0.8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          borderSide: BorderSide(color: theme.colorScheme.error, width: 0.8),
        ),
      ),
    );
  }
}
