import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../controller/search_controller.dart';

class SearchField {
  search(context) {
    final _controller = Get.find<SrcController>();
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
      child: Obx(() => TextFormField(
            autofocus: true,
            controller: _controller.searchController.value,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.hintSearch,
              prefixIcon: Icon(Icons.search),
            ),
          )),
    );
  }
}
