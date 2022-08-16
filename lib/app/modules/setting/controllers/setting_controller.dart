import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_hub/app/modules/home/controllers/home_controller.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/lang_model.dart';

class SettingController extends GetxController {
  final selectedLanguage = Get.locale!.languageCode.obs;
  final homeCon = Get.put(HomeController());
  late SharedPreferences prefs;
  final pageLoader = true.obs;
  Rx<List<DropdownMenuItem<String>>> langDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
  var selectedLang = '0'.obs;
  var isSwitched = false.obs;
  RxBool isLightTheme = false.obs;
  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    // selectedLanguage.value = Get.locale!.languageCode;
    await addLangDropdownList();
    getThemeStatus();
    pageLoader.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  saveThemeStatus() async {
    SharedPreferences pref = prefs;
    pref.setBool('theme', isLightTheme.value);
    getThemeStatus();
    homeCon.refreshMovies();
  }

  getThemeStatus() async {
    var _isLight = prefs.getBool('theme') ?? true;
    isLightTheme.value = _isLight;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  void changeTheme(bool value) {
    isSwitched.value = value;
    if (isSwitched.value) {}
  }

  void changeLanguage(String lang) {
    Locale locale = Locale(lang);
    Get.updateLocale(locale);
    selectedLanguage.value = lang;
  }

  final List<LanguageModel> languages = [
    LanguageModel("English", "en_US"),
    LanguageModel("Bengali", "bn"),
    LanguageModel("Telugu", "te"),
    LanguageModel("Urdu", "ur"),
    LanguageModel("Tamil", "ta"),
    LanguageModel("Spanish", "es"),
    LanguageModel("Marathi", "mr"),
    LanguageModel("Russian", "ru"),
    LanguageModel("Hindi", "hi"),
    LanguageModel("French", "fr"),
  ];

  Future<void> addLangDropdownList() async {
    langDropDownMenuItem.value = [];
    langDropDownMenuItem.value.add(
      const DropdownMenuItem(
        child: Text(
          'Select Language',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
        value: "0",
      ),
    );
    for (var i = 0; i < languages.length; i++) {
      LanguageModel model = languages.elementAt(i);
      langDropDownMenuItem.value.add(
        DropdownMenuItem(
          child: Text(
            model.language.toString(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          value: model.symbol.toString(),
        ),
      );
    }
  }
}
