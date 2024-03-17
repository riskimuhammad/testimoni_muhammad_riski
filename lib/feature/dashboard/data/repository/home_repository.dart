import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../../core/error/failure.dart';
import '../model/testimonial_model.dart';

abstract class HomeRepository {
  Future<Either<http.Response, Failure>> getTestimonial(
      TestimonialsModel? data);
}
