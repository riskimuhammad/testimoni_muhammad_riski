import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/presentation/controlller/home_controller.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/presentation/widget/languages_button.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/presentation/widget/list_tetstimonial.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/presentation/widget/search_field.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _searchfield = SearchField();
    final _languagesButton = LanguagesButton();
    final _listTestimonial = ListTetstimonial();
    final _controller = Get.find<HomeController>();
    return GetBuilder<HomeController>(
        init: HomeController(),
        initState: (state) {
          _controller.build(context);
        },
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              actions: [_languagesButton.languages(context)],
              flexibleSpace: _searchfield.search(),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Obx(() => _listTestimonial.list(context)),
            ),
          );
        });
  }
}
