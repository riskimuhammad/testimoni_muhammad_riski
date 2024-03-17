import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:muhammad_riski_testimoni/feature/search/data/datasources/search_datasources.dart';
import 'package:muhammad_riski_testimoni/feature/search/domain/repository/search_repository_impl.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/helper/dialog_helper.dart';
import '../../data/model/testimonial_model.dart';
import '../../domain/entity/testimonial_enitity.dart';

class SrcController extends GetxController {
  SearchRepositoryImpl? _repositoryImpl;
  final _datasources = SearchDatasources();
  Rx<ScrollController> scrollController = ScrollController().obs;
  RxList<TestimonialsEntity> listTestimonials = <TestimonialsEntity>[].obs;
  Rx<TextEditingController> searchController =
      TextEditingController(text: '').obs;
  Rx<bool> testimonialIsEmpty = false.obs;
  Rx<bool> testimonialIsLoading = false.obs;
  Rx<bool> searchByName = true.obs;
  Rx<bool> searchTestimonialIsEmpty = false.obs;
  Rx<int> currentPage = 1.obs;

  searchDataTestimonials({isName}) async {
    final params = TestimonialsModel(
        limit: 10,
        page: currentPage.value,
        search: searchController.value.text,
        name: isName != null ? searchController.value.text : '');
    List<TestimonialsEntity> listTestimonialsTmp = [];
    if (params.search!.isNotEmpty || params.name!.isNotEmpty) {
      listTestimonials.clear();
      searchTestimonialIsEmpty.value = false;
      final either = await getTestimonial(params);
      either.fold((l) {
        final responseDecode = json.decode(l.body);
        listTestimonials.refresh();
        for (var element in responseDecode) {
          listTestimonialsTmp.add(TestimonialsEntity.fromJson(element));
        }
        if (listTestimonials.isEmpty) {
          searchTestimonialIsEmpty.value = true;
        }
      }, (r) {
        searchTestimonialIsEmpty.value = true;
        searchByName.value = false;
      });
    }
    listTestimonials.value = listTestimonialsTmp;
    listTestimonials.refresh();
  }

  getDataTestimonial() async {
    testimonialIsLoading.value = true;
    Future.delayed(Duration(seconds: 2), () async {
      List<TestimonialsEntity> listTestimonialsTmp = [];
      final params = TestimonialsModel(
          limit: 10,
          page: currentPage.value,
          search: searchController.value.text,
          name: searchByName.value ? searchController.value.text : '');
      final either = await getTestimonial(params);
      either.fold((l) {
        final responseDecode = json.decode(l.body);
        for (var element in responseDecode) {
          element.addAll({'show': false});
          listTestimonialsTmp.add(TestimonialsEntity.fromJson(element));
        }
        if (listTestimonialsTmp.isEmpty) {
          testimonialIsEmpty.value = true;
          currentPage.value -= 1;
          testimonialIsLoading.value = false;
        } else {
          listTestimonials.addAll(listTestimonialsTmp);
          testimonialIsLoading.value = false;
        }
        Future.delayed(Duration(seconds: 2), () {
          testimonialIsEmpty.value = false;
        });
      }, (r) {
        DialogHelper.snackBarHelper(Get.context!, message: r.message);
        testimonialIsLoading.value = false;
      });
    });
  }

  onScroll() {
    if (scrollController.value.position.pixels ==
        scrollController.value.position.maxScrollExtent) {
      currentPage.value += 1;
      getDataTestimonial();
    }
  }

//ONTAP ONCHANGE ONLY START
//ONTAP ONCHANGE ONLY END

//REPOSITORY IMPL
  Future<Either<http.Response, Failure>> getTestimonial(
      TestimonialsModel? data) {
    return _repositoryImpl!.getTestimonial(data);
  }
//REPOSITORY IMPL END

  @override
  void onInit() {
    currentPage.value = 1;
    _repositoryImpl = SearchRepositoryImpl(_datasources);
    searchController.value.addListener(() {
      Future.delayed(Duration(seconds: 2));
      searchByName.value = true;
      searchDataTestimonials();
    });
    scrollController.value.addListener(onScroll);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.value.dispose();
    super.onClose();
  }
}
