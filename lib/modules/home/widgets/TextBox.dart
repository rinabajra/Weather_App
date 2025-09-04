import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../widgets/common/BlurBox.dart';
import '../../../widgets/fonts/Poppins.dart';
import '../../../widgets/global/Resize.dart';

class TextBox extends StatelessWidget {
  final String text;
  final String text2;

  const TextBox({super.key, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    return BlurBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 13.h),
            Poppins(
              text,
              size: 13,
              color: AppColors.tertiary,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 13.h),
              child: Poppins(text2, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
