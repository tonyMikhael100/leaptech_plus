import 'package:dio/dio.dart';
import 'package:leaptech_plus/features/home/data/api/home_api_constants.dart';
import 'package:leaptech_plus/features/home/data/models/quote_model.dart';
import 'package:retrofit/retrofit.dart';
part 'home_api_service.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;
  @GET(HomeApiConstants.quoteOfTheDay)
  Future<List<QuoteModel>> getQuoteOfTheDay(

  );
}
