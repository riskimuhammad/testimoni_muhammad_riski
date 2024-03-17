import 'package:dartz/dartz.dart';
import 'package:http/src/response.dart';
import 'package:muhammad_riski_testimoni/core/error/failure.dart';

import '../../data/datasources/home_datasources.dart';
import '../../data/model/Testimonial_model.dart';
import '../../data/repository/home_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchDatasources _datasources;
  SearchRepositoryImpl(this._datasources);
  @override
  Future<Either<Response, Failure>> getTestimonial(TestimonialsModel? data) {
    return _datasources.getTestimonial(data);
  }
}
