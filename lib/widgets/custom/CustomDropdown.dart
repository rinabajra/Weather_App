import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/utils/i18n/languages.dart';
import 'package:weather_app/widgets/fonts/Poppins.dart';
import 'package:weather_app/widgets/global/Resize.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class Customdropdown extends StatelessWidget {
  final bool shadow;
  final bool darkColor;
  final bool regularWeight;
  final List<String> options;
  final bool fromTranslations;
  final Function(String) onChanged;
  final String? hint;
  final String? label;
  final String? value;

  const Customdropdown({
    required this.options,
    required this.onChanged,
    this.shadow = true,
    this.darkColor = true,
    this.regularWeight = false,
    this.fromTranslations = false,
    this.hint,
    this.label,
    this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null)
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Poppins.medium(label!, size: 14),
          ),
        DropdownButton<String>(
          value: value,
          elevation: 8,
          isDense: true,
          iconSize: 30.h,
          isExpanded: true,
          menuMaxHeight: 300.h,
          underline: const SizedBox(),
          onChanged: (val) => onChanged(val!),
          dropdownColor: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          hint: hint != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Poppins.medium(
                    hint!,
                    size: 16,
                    color: AppColors.mainText,
                  ),
                )
              : null,
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondary.withValues(alpha: 0.5),
            ),
            child: SvgPicture.asset(
              '$kIconsPath/language.svg',
              width: 30.h,
              height: 30.h,
            ),
          ),
          items: (options)
              .map<DropdownMenuItem<String>>(
                (String val) => DropdownMenuItem<String>(
                  value: val,
                  child: Poppins(
                    val.toUpperCase() +
                        (fromTranslations
                            ? AppTranslation.kTranslationList
                                  .firstWhere((value) => value.contains(val))
                                  .substring(2)
                            : ''),
                    size: 16,
                  ),
                ),
              )
              .toList(),
          selectedItemBuilder: (BuildContext context) => (options)
              .map<Widget>(
                (String val) => Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Poppins(
                    val.toUpperCase() +
                        (fromTranslations
                            ? AppTranslation.kTranslationList
                                  .firstWhere((value) => value.contains(val))
                                  .substring(2)
                            : ''),
                    size: 16,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
