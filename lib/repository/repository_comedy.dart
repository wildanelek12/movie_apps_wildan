import 'package:dio/dio.dart';
import 'package:movie_apps_wildan/constants/constants_api.dart';
import 'package:movie_apps_wildan/model/comedy_response_model.dart';


class RepositoryComedy {
  static Future<ComedyResponseModel> trending() async {
    var dio = Dio();
    Map<String, dynamic> parameter = {
      "api_key": API_KEY,
      "with_genres": "27",
    };
    Response response = await dio.get(
        "https://api.themoviedb.org/3/discover/movie/",
        queryParameters: parameter);
    return ComedyResponseModel.fromJson(response.data);
  }
}
