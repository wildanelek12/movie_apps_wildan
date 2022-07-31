import 'package:dio/dio.dart';
import 'package:movie_apps_wildan/constants/constants_api.dart';
import 'package:movie_apps_wildan/model/comedy_response_model.dart';
import 'package:movie_apps_wildan/model/detail_response_model.dart';
import 'package:movie_apps_wildan/helper/base_config.dart';


class RepositoryDetail {
  static Future<DetailResponseModel> detail(int movieId) async {
    var dio = Dio();
    Map<String, dynamic> parameter = {
      "api_key": API_KEY,
    };
    Response response = await dio.get(
        Config.movieDetailUrl(movieId),
        queryParameters: parameter);
    return DetailResponseModel.fromJson(response.data);
  }
}
