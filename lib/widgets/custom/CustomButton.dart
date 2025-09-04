import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/widgets/fonts/Poppins.dart';
import 'package:weather_app/widgets/global/Resize.dart';

import '../../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final int flex;
  final String text;
  final bool loading;
  final bool disabled;
  final bool tertiary;
  final bool secondary;
  final bool showShadow;
  final Function onPressed;
  final double borderRadius;
  final Color? color;
  final double? width;
  final Widget? child;
  final double? height;
  final Color? textColor;
  final double? shadowBlurRadius;
  final double size;
  final double? loadingSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.flex = 1,
    this.loading = false,
    this.disabled = false,
    this.tertiary = false,
    this.secondary = false,
    this.showShadow = false,
    this.borderRadius = 20,
    this.color,
    this.width,
    this.child,
    this.height,
    this.textColor,
    this.shadowBlurRadius,
    this.size = 18,
    this.loadingSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: flex,
            child: ElevatedButton(
              onPressed: disabled || loading
                  ? null
                  : () {
                      onPressed();
                      HapticFeedback.lightImpact();
                    },
              style: ButtonStyle(
                elevation: WidgetStateProperty.all(0),
                overlayColor: WidgetStateProperty.all(
                  AppColors.white.withValues(alpha: 0.1),
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius.h),
                  ),
                ),
                padding: height != null
                    ? WidgetStateProperty.all<EdgeInsets>(EdgeInsets.all(0))
                    : WidgetStateProperty.all<EdgeInsets>(EdgeInsets.all(12.h)),
                backgroundColor: WidgetStateProperty.all<Color>(
                  disabled
                      ? AppColors.disabledGrey
                      : color ??
                            (secondary
                                ? AppColors.secondary
                                : tertiary
                                ? AppColors.tertiary
                                : AppColors.main),
                ),
              ),
              child: loading
                  ? SpinKitCircle(size: loadingSize!, color: AppColors.white)
                  : child ??
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Poppins.bold(
                                text,
                                size: size,
                                color: disabled
                                    ? AppColors.black
                                    : textColor ??
                                          (secondary
                                              ? AppColors.mainText
                                              : tertiary
                                              ? AppColors.white
                                              : AppColors.white),
                              ),
                            ),
                          ],
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
