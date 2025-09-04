import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class Poppins extends StatelessWidget {
  final bool italic;
  final bool shadow;
  final Color color;
  final double size;
  final String text;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final int? maxLines;
  final bool? softWrap;
  final Locale? locale;
  final TextStyle? style;
  final String? sematicsLabel;
  final StrutStyle? strutStyle;
  final TextOverflow? overFlow;
  final double? textScaleFactor;
  final TextDirection? textDirection;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String fontFamily = 'Poppins';

  const Poppins(
    this.text, {
    super.key,
    this.size = 16,
    this.italic = false,
    this.shadow = false,
    this.color = AppColors.mainText,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.w400,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
  });

  const Poppins.thin(
    this.text, {
    super.key,
    this.size = 16,
    this.shadow = false,
    this.italic = false,
    this.color = AppColors.mainText,
    this.textAlign = TextAlign.center,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
  }) : fontWeight = FontWeight.w100;

  const Poppins.light(
    this.text, {
    super.key,
    this.size = 16,
    this.italic = false,
    this.shadow = false,
    this.color = AppColors.mainText,
    this.textAlign = TextAlign.center,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
  }) : fontWeight = FontWeight.w300;

  const Poppins.medium(
    this.text, {
    super.key,
    this.size = 16,
    this.italic = false,
    this.shadow = false,
    this.color = AppColors.mainText,
    this.textAlign = TextAlign.center,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
  }) : fontWeight = FontWeight.w600;

  const Poppins.bold(
    this.text, {
    super.key,
    this.size = 16,
    this.italic = false,
    this.shadow = false,
    this.color = AppColors.mainText,
    this.textAlign = TextAlign.center,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
  }) : fontWeight = FontWeight.w700;

  const Poppins.extraBold(
    this.text, {
    super.key,
    this.size = 16,
    this.italic = false,
    this.shadow = false,
    this.color = AppColors.mainText,
    this.textAlign = TextAlign.center,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
  }) : fontWeight = FontWeight.w800;

  const Poppins.black(
    this.text, {
    super.key,
    this.size = 16,
    this.italic = false,
    this.shadow = false,
    this.color = AppColors.mainText,
    this.textAlign = TextAlign.center,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.textWidthBasis,
    this.textScaleFactor = 1.0,
    this.textHeightBehavior,
  }) : fontWeight = FontWeight.w900;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      key: key,
      locale: locale,
      maxLines: maxLines,
      overflow: overFlow,
      softWrap: softWrap,
      textAlign: textAlign,
      strutStyle: strutStyle,
      textDirection: textDirection,
      semanticsLabel: sematicsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      style: style == null
          ? TextStyle(
              color: color,
              fontSize: size,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
              shadows: [
                if (shadow)
                  Shadow(
                    color: AppColors.black.withValues(alpha: 0.2),
                    offset: Offset(0, 2),
                    blurRadius: 6,
                  ),
              ],
              fontStyle: italic ? FontStyle.italic : FontStyle.normal,
            )
          : TextStyle(
              fontSize: size,
              color: style!.color ?? color,
              locale: style!.locale,
              height: style!.height,
              fontFamily: fontFamily,
              shadows: style!.shadows,
              inherit: style!.inherit,
              foreground: style!.foreground,
              background: style!.background,
              decoration: style!.decoration,
              debugLabel: style!.debugLabel,
              wordSpacing: style!.wordSpacing,
              textBaseline: style!.textBaseline,
              fontFeatures: style!.fontFeatures,
              letterSpacing: style!.letterSpacing,
              backgroundColor: style!.backgroundColor,
              decorationColor: style!.decorationColor,
              decorationStyle: style!.decorationStyle,
              fontWeight: style!.fontWeight ?? fontWeight,
              fontFamilyFallback: style!.fontFamilyFallback,
              decorationThickness: style!.decorationThickness,
              leadingDistribution: style!.leadingDistribution,
              fontStyle: italic ? FontStyle.italic : FontStyle.normal,
            ),
    );
  }
}
