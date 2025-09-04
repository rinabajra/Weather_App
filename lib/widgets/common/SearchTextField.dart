import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/translations.dart';
import '../custom/CustomTextField.dart';
import '../global/CustomInkWell.dart';

class SearchTextfield extends StatelessWidget {
  final bool showClose;
  final String? hintText;
  final FocusNode? focusNode;
  final VoidCallback? onTapCross;
  final Function(String p1)? onChanged;
  final TextEditingController? searchController;
  final String? suffixIcon;

  const SearchTextfield({
    super.key,
    this.searchController,
    this.showClose = false,
    this.hintText,
    this.focusNode,
    this.onChanged,
    this.onTapCross,
    this.suffixIcon = 'search.svg',
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onChanged: onChanged,
      focusNode: focusNode,
      type: TextInputType.text,
      readOnly: searchController == null,
      hint: hintText ?? t('form.search'),
      controller: searchController ?? TextEditingController(),
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 7),
        child: SvgPicture.asset(
          '$kIconsPath/$suffixIcon',
          width: 20,
          colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
        ),
      ),
      prefixIcon: Row(
        children: <Widget>[
          showClose
              ? CustomInkWell(
                  onTap: onTapCross,
                  child: SvgPicture.asset('$kIconsPath/close_icon.svg'),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
