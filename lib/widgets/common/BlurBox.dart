import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:weather_app/utils/colors.dart';

class BlurBox extends StatelessWidget {
  final Widget child;

  const BlurBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1.5,
              color: AppColors.white.withValues(alpha: .3),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
