import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/widgets/global/Resize.dart';

class CustomInkWell extends StatelessWidget {
  final Widget child;
  final bool disabled;
  final Color splashColor;
  final double paddingAll;
  final bool hapticFeedback;
  final double borderRadius;
  final VoidCallback? onTap;
  final BorderRadius? radius;

  const CustomInkWell({
    required this.child,
    required this.onTap,
    this.paddingAll = 0,
    this.disabled = false,
    this.borderRadius = 25,
    this.hapticFeedback = true,
    this.splashColor = Colors.white,
    this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Widget paddedChild = Padding(
      padding: EdgeInsets.all(paddingAll),
      child: child,
    );

    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(borderRadius.h),
      child: Material(
        color: Colors.transparent,
        child: disabled
            ? paddedChild
            : InkWell(
                splashColor: splashColor.withValues(alpha: .2),
                highlightColor: splashColor.withValues(alpha: .2),
                onTap: onTap == null
                    ? null
                    : () {
                        if (hapticFeedback) HapticFeedback.lightImpact();

                        onTap!();
                      },
                child: paddedChild,
              ),
      ),
    );
  }
}
