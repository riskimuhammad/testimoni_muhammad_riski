import 'package:dartz/dartz.dart';
import 'package:muhammad_riski_testimoni/core/error/failure.dart';
import 'package:muhammad_riski_testimoni/core/helper/service_helper.dart';
import 'package:http/http.dart' as http;

import '../model/testimonial_model.dart';

class HomeDatasources {
  Future<Either<http.Response, Failure>> getTestimonial(
      TestimonialsModel? data) async {
    try {
      final response = await http.get(Uri.parse(
          "${ServiceHelper.BASE_URL + ServiceHelper.PATH + ServiceHelper.TESTIMONIALS_ENDPOINT}?page=${data!.page}&limit=${data.limit}"));
      if (response.statusCode == 200) {
        return Left(response);
      } else {
        return Right(Failure(message: 'Gagal mengambil data !'));
      }
    } catch (e) {
      return Right(Failure(message: 'Error internal server !'));
    }
  }
}
