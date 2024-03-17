import 'package:dartz/dartz.dart';
import 'package:http/src/response.dart';
import 'package:muhammad_riski_testimoni/core/error/failure.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/data/datasources/home_datasources.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/data/model/Testimonial_model.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/data/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeDatasources _datasources;
  HomeRepositoryImpl(this._datasources);
  @override
  Future<Either<Response, Failure>> getTestimonial(TestimonialsModel? data) {
    return _datasources.getTestimonial(data);
  }
}
