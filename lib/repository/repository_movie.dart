import 'package:dio/dio.dart';
import 'package:movie_apps_wildan/constants/constants_api.dart';
import 'package:movie_apps_wildan/model/trending_response_model.dart';

class RepositoryMovie {
  static Future<TrendingResponseModel> trending() async {
    var dio = Dio();
    Map<String, dynamic> parameter = {
      "api_key": API_KEY,
    };
    Response response = await dio.get(
        "https://api.themoviedb.org/3/trending/all/day",
        queryParameters: parameter);
    return TrendingResponseModel.fromJson(response.data);
  }
}
