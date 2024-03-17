import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhammad_riski_testimoni/core/helper/dialog_helper.dart';
import 'package:muhammad_riski_testimoni/core/helper/languages_key.dart';
import 'package:muhammad_riski_testimoni/core/helper/session_helper.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/data/datasources/home_datasources.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/data/model/testimonial_model.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/domain/entity/testimonial_enitity.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/domain/repository/home_repository_impl.dart';
import 'package:muhammad_riski_testimoni/main.dart';
import 'package:http/http.dart' as http;
import '../../../../core/error/failure.dart';

class HomeController extends GetxController {
  final _datasources = HomeDatasources();
  HomeRepositoryImpl? _repositoryImpl;
  Rx<TextEditingController> searchController =
      TextEditingController(text: '').obs;
  Rx<LanguagesKey> languagesKey = LanguagesKey().obs;
  Rx<String> lnCode = ''.obs;

  RxList<TestimonialsEntity> listTestimonials = <TestimonialsEntity>[].obs;
  Rx<bool> contentExpanded = false.obs;
  Rx<bool> testimonialIsEmpty = false.obs;
  Rx<bool> testimonialIsLoading = false.obs;
  Rx<int> currentPage = 1.obs;
  Rx<ScrollController> scrollController = ScrollController().obs;
  build(context) async {
    generateSession(context);
    getDataTestimonial();
  }

  generateSession(context) async {
    final ln = await SessionHelper.getGessionLanguages();
    if (ln != null) {
      TestimoniApp.setLocale(context, Locale(ln, ''));
      lnCode.value = ln;
    }
  }

  getDataTestimonial() async {
    if (currentPage.value > 1) testimonialIsLoading.value = true;
    List<TestimonialsEntity> listTestimonialsTmp = [];
    final params = TestimonialsModel(limit: 10, page: currentPage.value);
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
  }

//ONTAP ONCHANGE ONLY
  onChangeLanguages(context, LanguagesKey? ln) {
    if (ln != null) {
      TestimoniApp.setLocale(context, Locale(ln.languageCode!, ''));
      SessionHelper.setSessionLanguages(ln.languageCode);
      lnCode.value = ln.languageCode!;
    }
  }

  lassMoreContent(index) {
    listTestimonials[index].show = !listTestimonials[index].show!;
    listTestimonials.refresh();
  }

  onScroll() {
    if (scrollController.value.position.pixels ==
        scrollController.value.position.maxScrollExtent) {
      currentPage.value += 1;
      getDataTestimonial();
    }
  }
//ONTAP ONCHANGE ONLY END

//REPOSITORY IMPL
  Future<Either<http.Response, Failure>> getTestimonial(
      TestimonialsModel? data) {
    return _repositoryImpl!.getTestimonial(data);
  }
//REPOSITORY IMPL END

  @override
  void onInit() {
    listTestimonials.clear();
    currentPage.value = 1;
    _repositoryImpl = HomeRepositoryImpl(_datasources);
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
