import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:muhammad_riski_testimoni/feature/search/presentation/widget/list_tetstimonial.dart';

class MainSearchPage extends StatelessWidget {
  const MainSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _listTestimonial = ListTetstimonial();
    return Hero(
      tag: 'SEARCH',
      child: Material(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.hintSearch,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Obx(() => _listTestimonial.list(context)),
          ],
        ),
      )),
    );
  }
}
