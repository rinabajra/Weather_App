import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/home/menu/controller.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/translations.dart';
import 'package:weather_app/widgets/fonts/Poppins.dart';
import 'package:weather_app/widgets/global/CustomInkWell.dart';
import 'package:weather_app/widgets/global/Resize.dart';

class ListFromSearch extends StatelessWidget {
  const ListFromSearch({super.key, required this.controller});

  final MenuSettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: Get.width,
      padding: EdgeInsets.only(top: 7.h),
      margin: EdgeInsets.only(top: 5.h),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 0,
            offset: const Offset(0, 1),
            color: AppColors.disabledGrey.withValues(alpha: 0.3),
          ),
        ],
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: Obx(
        () => controller.loading()
            ? SpinKitFadingCircle(color: AppColors.main, size: 30)
            : controller.searchNames().isEmpty
            ? Poppins.medium(
                t('home.no_data'),
                size: 16,
                color: AppColors.black,
              )
            : ListView.builder(
                key: UniqueKey(),
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                addAutomaticKeepAlives: false,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                itemCount: controller.searchNames().length,
                itemBuilder: (_, i) {
                  return Obx(
                    () => CustomInkWell(
                      paddingAll: 2,
                      splashColor: AppColors.main,
                      onTap: () => controller.onTapItem(i),
                      radius: BorderRadius.all(Radius.zero),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: Poppins.bold(
                              '${controller.searchNames()[i].name}, ${controller.searchNames()[i].country}',
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
