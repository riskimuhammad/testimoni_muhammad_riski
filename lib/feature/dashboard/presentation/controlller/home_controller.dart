import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhammad_riski_testimoni/core/helper/languages_key.dart';
import 'package:muhammad_riski_testimoni/main.dart';

class HomeController extends GetxController {
  Rx<TextEditingController> searchController =
      TextEditingController(text: '').obs;
  Rx<LanguagesKey> languagesKey = LanguagesKey().obs;

//ONTAP ONCHANGE ONLY
  onChangeLanguages(context, LanguagesKey? ln) {
    if (ln != null) {
      TestimoniApp.setLocale(context, Locale(ln.languageCode!, ''));
    }
  }
//ONTAP ONCHANGE ONLY END
}
