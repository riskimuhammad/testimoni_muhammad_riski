import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhammad_riski_testimoni/core/helper/dialog_helper.dart';
import 'package:muhammad_riski_testimoni/core/helper/languages_key.dart';
import 'package:muhammad_riski_testimoni/core/helper/session_helper.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/data/datasources/home_datasources.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/data/model/Testimonial_model.dart';
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

  RxList<TestimonialsEntity> listTestimonials = <TestimonialsEntity>[].obs;
  build(context) async {
    generateSession(context);
    getDataTestimonial(context);
  }

  generateSession(context) async {
    final ln = await SessionHelper.getGessionLanguages();
    if (ln != null) {
      TestimoniApp.setLocale(context, Locale(ln, ''));
    }
  }

  getDataTestimonial(context) async {
    listTestimonials.clear();
    final params = TestimonialsModel(limit: 10, page: 1);
    final either = await getTestimonial(params);
    either.fold((l) {
      final responseDecode = json.decode(l.body);
      for (var element in responseDecode) {
        listTestimonials.add(TestimonialsEntity.fromJson(element));
      }
    }, (r) {
      DialogHelper.snackBarHelper(context, message: r.message);
    });
  }

//ONTAP ONCHANGE ONLY
  onChangeLanguages(context, LanguagesKey? ln) {
    if (ln != null) {
      TestimoniApp.setLocale(context, Locale(ln.languageCode!, ''));
      SessionHelper.setSessionLanguages(ln.languageCode);
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
    _repositoryImpl = HomeRepositoryImpl(_datasources);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
