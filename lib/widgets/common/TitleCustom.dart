import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/widgets/global/Resize.dart';

class TitleCustom extends StatelessWidget {
  final String title;
  final String keyword;

  const TitleCustom({super.key, required this.title, required this.keyword});

  @override
  Widget build(BuildContext context) {
    final List titleSplitted = title.split(keyword);
    final String first = titleSplitted.first;
    final String last = titleSplitted.last;

    return RichText(
      text: TextSpan(
        text: first,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21.h,
          height: 1.5,
          color: AppColors.mainText,
          fontFamily: 'FavoritStd',
        ),
        children: <TextSpan>[
          TextSpan(
            text: keyword,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21.h,
              color: AppColors.main,
              fontFamily: 'FavoritStd',
            ),
          ),
          TextSpan(
            text: last,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21.h,
              color: AppColors.mainText,
              fontFamily: 'FavoritStd',
            ),
          ),
        ],
      ),
    );
  }
}
