import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:muhammad_riski_testimoni/core/error/failure.dart';

import '../../data/datasources/search_datasources.dart';
import '../../data/model/testimonial_model.dart';
import '../../data/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchDatasources _datasources;
  SearchRepositoryImpl(this._datasources);
  @override
  Future<Either<Response, Failure>> getTestimonial(TestimonialsModel? data) {
    return _datasources.getTestimonial(data);
  }
}
