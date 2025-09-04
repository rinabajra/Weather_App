import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:weather_app/widgets/global/CustomInkWell.dart';
import 'package:weather_app/widgets/global/Resize.dart';

class AnimatedDots extends StatelessWidget {
  final int length;
  final Color color;
  final double page;
  final double height;
  final double? width;
  final PageController pageController;

  const AnimatedDots({
    required this.page,
    required this.color,
    required this.pageController,
    this.length = 2,
    this.height = 5,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < length; i++)
          AnimatedDot(
            page: page,
            color: color,
            width: width,
            height: height,
            maxAt: i.toDouble(),
            onTap: () => pageController.animateToPage(
              i,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 300),
            ),
          ),
      ],
    );
  }
}

class AnimatedDot extends StatelessWidget {
  final Color color;
  final double page;
  final double maxAt;
  final double height;
  final double? width;
  final VoidCallback? onTap;

  const AnimatedDot({
    super.key,
    required this.page,
    required this.maxAt,
    required this.color,
    this.onTap,
    this.width,
    this.height = 5,
  });

  @override
  Widget build(BuildContext context) {
    double clampedValue =
        page.clamp(min(maxAt - 1, 0), max(maxAt + 1, 2)) - maxAt;
    double animationValue = clampedValue < 0
        ? -clampedValue * -1 + 1
        : clampedValue * -1 + 1;

    return CustomInkWell(
      onTap: onTap,
      paddingAll: 4,
      child: AnimatedBuilder(
        animation: ValueNotifier(page),
        builder: (context, child) => Container(
          height: height.h,
          width: width?.h ?? ((3 * animationValue.clamp(0, 1) + 1) * height).h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: ColorTween(
              end: color,
              begin: color.withValues(alpha: 0.2),
            ).lerp(animationValue.clamp(0, 1)),
          ),
        ),
      ),
    );
  }
}
