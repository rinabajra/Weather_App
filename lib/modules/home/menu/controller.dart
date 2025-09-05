import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/models/search_city.model.dart';
import 'package:weather_app/core/services/translations.service.dart';
import 'package:weather_app/modules/home/controller.dart';

import '../../../core/providers/home.provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/errors.dart';

class MenuSettingsController extends GetxController {
  Timer? _debounce;
  final RxBool loading = false.obs;
  final RxBool hasText = false.obs;
  final RxBool isEmptySearch = true.obs;
  final RxBool showDropdown = false.obs;
  final FocusNode searchFN = FocusNode();
  final RxBool showErrorLocation = false.obs;
  final RxList<SearchCity> searchNames = <SearchCity>[].obs;
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() async {
    searchController.addListener(() {
      hasText(searchController.text.isNotEmpty);
    });
    super.onInit();
  }

  void clearSearch() async {
    if (searchFN.hasFocus) {
      searchFN.unfocus();
    }
    if (searchController.text.isNotEmpty) {
      searchController.clear();
      hasText.value = false;
    }
    searchNames().clear();
    showDropdown(false);
  }

  void onSearchTextChanged() {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    isEmptySearch(searchController.text.trim().isEmpty);

    Timer.periodic(
      Duration(milliseconds: 500),
      (_) => showDropdown(searchController.text.trim().isNotEmpty),
    );

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (searchController.text.trim().isNotEmpty) {
        getSearch();
      } else {
        showDropdown(false);
      }
    });
  }

  Future<void> getSearch() async {
    try {
      loading(true);
      searchNames(
        await HomeProvider().getSearchCity(searchController.text.trim()),
      );
    } catch (e) {
      showError('getForecast :', e);
    } finally {
      loading(false);
    }
  }

  void onTapItem(int i) {
    Get.back();
    showDropdown(false);
    searchController.text = searchNames()[i].name;
    kAppStorage.write(
      kSavedLatLong,
      '${searchNames()[i].lat},${searchNames()[i].lon}',
    );
    Get.find<HomeController>().savedLatLong =
        '${searchNames()[i].lat},${searchNames()[i].lon}';

    Get.find<HomeController>().getForecast(
      searchNames()[i].lat,
      searchNames()[i].lon,
      Get.find<TranslationsService>().locale ?? 'en',
      Get.find<HomeController>().savedUnit(),
      fetchNewData: true,
    );
  }

  Future<void> changeUnit(UNITS unit) async {
    kAppStorage.write(kSavedUnit, unit.name);

    Get.find<HomeController>().savedUnit(unit);

    await Get.find<HomeController>().initAsync(fetchNewData: true);
  }

  @override
  void onClose() {
    searchController.dispose();

    super.onClose();
  }
}
