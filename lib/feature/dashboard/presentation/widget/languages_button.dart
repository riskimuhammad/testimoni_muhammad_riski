import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhammad_riski_testimoni/core/helper/languages_key.dart';
import 'package:muhammad_riski_testimoni/core/material/material_color.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/presentation/controlller/home_controller.dart';

class LanguagesButton {
  languages(context) {
    final _controller = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 16),
      child: DropdownButton<LanguagesKey>(
          icon: Icon(
            Icons.language,
            color: TestimonialColor.primaryColorsGrey.shade200,
          ),
          value: _controller.languagesKey.value.id == null
              ? null
              : _controller.languagesKey.value,
          underline: SizedBox(),
          items: LanguagesKey.languagesKeyList()
              .map<DropdownMenuItem<LanguagesKey>>((ln) =>
                  DropdownMenuItem(value: ln, child: Text(ln.name ?? '')))
              .toList(),
          onChanged: (ln) => _controller.onChangeLanguages(context, ln)),
    );
  }
}
