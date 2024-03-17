import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhammad_riski_testimoni/core/helper/navigator_helper.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/presentation/controlller/home_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchField {
  search(context) {
    final _controller = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 70, top: 30),
      child: Hero(
        tag: 'SEARCH',
        child: Material(
          child: TextFormField(
            readOnly: true,
            onTap: () => Get.toNamed(routeName.search),
            controller: _controller.searchController.value,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.hintSearch,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
