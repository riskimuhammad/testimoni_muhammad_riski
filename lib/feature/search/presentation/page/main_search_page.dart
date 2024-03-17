import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhammad_riski_testimoni/feature/search/presentation/widget/list_tetstimonial.dart';

import '../widget/search_field.dart';

class MainSearchPage extends StatelessWidget {
  const MainSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _listTestimonial = ListTetstimonial();
    final _searchField = SearchField();
    return Hero(
      tag: 'SEARCH',
      child: Material(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            _searchField.search(context),
            Obx(() => Expanded(child: _listTestimonial.list(context))),
          ],
        ),
      )),
    );
  }
}
