import 'package:desafio_02_movies/core/singletons/utils/constants.dart';

class ApiRoutes {
  // API Key
  static const String apiKey = 'api_key=${Constants.apiKey}';
  // Routes
  static const String popularUrl = "/trending/movie/day?$apiKey";
  static const String topRatedUrl = "/movie/top_rated?$apiKey";
  static const String upcomingUrl = '/movie/upcoming?$apiKey';
}
