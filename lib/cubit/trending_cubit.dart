import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_apps_wildan/model/trending_response_model.dart';
import 'package:movie_apps_wildan/repository/repository_movie.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingInitial());
  TrendingResponseModel? trendingResponseModel;
  getTrending()async{
    try{
      emit(InitTrendingState());
      trendingResponseModel = await RepositoryMovie.trending();
      emit(DownTrendingState());
    }catch(error,stacktrace){
      emit(FailedTrendingState(message: error.toString()));
      print(error.toString()+stacktrace.toString());
    }
  }


}
