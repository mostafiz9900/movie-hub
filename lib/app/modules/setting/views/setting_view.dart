import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Setting'.tr),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Obx(() => controller.pageLoader.value
              ? LinearProgressIndicator()
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Get.theme.canvasColor,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Get.theme.cardColor,
                                  spreadRadius: 1.0,
                                  blurRadius: 6,
                                  offset: const Offset(0, 0))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Obx(
                                () => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Click on switch to change to ${controller.isLightTheme.value ? 'Dark' : 'Light'} theme',
                                    style: Get.textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                            ),
                            ObxValue(
                              (data) => Switch(
                                value: controller.isLightTheme.value,
                                onChanged: (val) {
                                  controller.isLightTheme.value = val;
                                  Get.changeThemeMode(
                                    controller.isLightTheme.value
                                        ? ThemeMode.light
                                        : ThemeMode.dark,
                                  );
                                  controller.saveThemeStatus();
                                },
                              ),
                              false.obs,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _LanguageDropdownWidget(),
                    ],
                  ),
                )),
        ));
  }
}

class _LanguageDropdownWidget extends StatelessWidget {
  const _LanguageDropdownWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appCon = Get.find<SettingController>();
    return Container(
      // padding: const EdgeInsets.only(left: 8.0, right: 10.0),
      width: Get.width,
      decoration: BoxDecoration(
          color: Get.theme.secondaryHeaderColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Get.theme.secondaryHeaderColor,
                spreadRadius: 1.0,
                blurRadius: 6,
                offset: const Offset(0, 0))
          ]),
      child: Obx(
        () => DropdownButtonFormField(
          elevation: 20,
          isExpanded: true,
          iconEnabledColor: Colors.blueGrey,
          iconSize: 40,
          icon: const Icon(
            Icons.arrow_right,
            size: 40,
            color: Colors.red,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) {
            print('$val');
            // return controller.validateZone(val.toString());
          },
          focusColor: Get.theme.primaryColor,
          decoration: dropDownDecoration(),
          items: appCon.langDropDownMenuItem.value,
          // value: appCon.selectedLanguage.value,
          hint: Text("Select Language"),
          onChanged: (selectedValue) {
            print('${selectedValue}');

            appCon.selectedLanguage.value = selectedValue.toString();
            appCon.changeLanguage(selectedValue.toString());
            // if (controller.selectedZoneId.value != "0") {
            //   controller.getState(controller.selectedZoneId.value);
            // }
          },
        ),
      ),
    );
  }

  InputDecoration dropDownDecoration() {
    return InputDecoration(
      enabled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Get.theme.primaryColor, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Get.theme.primaryColor, width: 1.5),
      ),
      fillColor: Get.theme.primaryColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Get.theme.primaryColor, width: 0.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
  }
}
