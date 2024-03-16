import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/presentation/controlller/home_controller.dart';

class SearchField {
  search() {
    final _controller = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 70, top: 30),
      child: TextFormField(
        controller: _controller.searchController.value,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
