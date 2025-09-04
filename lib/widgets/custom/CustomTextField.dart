import 'package:flutter/material.dart';
import 'package:weather_app/widgets/fonts/Poppins.dart';
import 'package:weather_app/widgets/global/Resize.dart';

import '../../utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final bool error;
  final String hint;
  final bool obscured;
  final bool readOnly;
  final bool autoCorrect;
  final bool borderStyle;
  final String errorText;
  final TextInputType type;
  final bool showErrorShadow;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final Widget? icon;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Color? textColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function? onSubmit;
  final Function? onObscure;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? iconOnPressed;
  final Function(String)? onChanged;
  final Iterable<String>? autofillHints;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.error = false,
    this.errorText = '',
    this.obscured = false,
    this.readOnly = false,
    this.autoCorrect = true,
    this.borderStyle = false,
    this.showErrorShadow = false,
    this.type = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.icon,
    this.padding,
    this.maxLines,
    this.minLines,
    this.onSubmit,
    this.onObscure,
    this.maxLength,
    this.onChanged,
    this.focusNode,
    this.textColor,
    this.suffixIcon,
    this.prefixIcon,
    this.autofillHints,
    this.iconOnPressed,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: maxLines == null ? 50.h : null,
          padding: EdgeInsets.only(bottom: 2.h),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: borderStyle ? null : BorderRadius.circular(20),
            border: error
                ? Border.all(color: AppColors.errorRed, width: 1)
                : null,
          ),
          child: Padding(
            padding: contentPadding ?? EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (suffixIcon != null) suffixIcon!,
                Expanded(
                  child: TextField(
                    onSubmitted: (value) {
                      if (onSubmit != null) {
                        onSubmit!();
                      }
                    },
                    readOnly: readOnly,
                    keyboardType: type,
                    minLines: minLines,
                    maxLength: maxLength,
                    onChanged: onChanged,
                    focusNode: focusNode,
                    controller: controller,
                    maxLines: maxLines ?? 1,
                    autocorrect: autoCorrect,
                    enableSuggestions: false,
                    autofillHints: autofillHints,
                    cursorColor: AppColors.main,
                    textInputAction: textInputAction,
                    obscureText:
                        type == TextInputType.visiblePassword && obscured,
                    textCapitalization: type == TextInputType.name
                        ? TextCapitalization.words
                        : TextCapitalization.none,
                    style: TextStyle(
                      height: 0.9,
                      fontSize: 18.h,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      color: textColor ?? AppColors.mainText,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: hint,
                      counterText: '',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        height: 0.9,
                        fontSize: 18.h,
                        fontFamily: 'Roboto',
                        color: AppColors.hintText,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                if (type == TextInputType.visiblePassword)
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    splashColor: AppColors.main.withValues(alpha: .4),
                    onPressed: () {
                      if (onObscure != null) {
                        onObscure!();
                      }
                    },
                    icon: !obscured
                        ? const Icon(
                            Icons.remove_red_eye_rounded,
                            color: AppColors.main,
                            size: 23,
                          )
                        : const Icon(
                            Icons.visibility_off_rounded,
                            color: AppColors.main,
                            size: 23,
                          ),
                  ),
                if (icon != null)
                  IconButton(
                    icon: icon!,
                    onPressed: iconOnPressed,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    splashColor: AppColors.main.withValues(alpha: .4),
                  ),
                if (prefixIcon != null) prefixIcon!,
              ],
            ),
          ),
        ),
        if (errorText.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                if (showErrorShadow)
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 0.1,
                    offset: Offset(0, 3),
                    color: AppColors.black.withValues(alpha: .9),
                  ),
              ],
            ),
            padding: EdgeInsets.only(top: 5.rs, left: 8, right: 8),
            child: Poppins(errorText, size: 15, color: AppColors.errorRed),
          ),
      ],
    );
  }
}
