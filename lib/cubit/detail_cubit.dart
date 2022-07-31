import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_apps_wildan/model/detail_response_model.dart';
import 'package:movie_apps_wildan/repository/repository_detail.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitial());
  DetailResponseModel? detailResponseModel;
  Future<void> getDetail(int movieId) async{
    try{
      emit(DetailInitial());
      detailResponseModel = await RepositoryDetail.detail(movieId);
      emit(DetailDown());
    }catch(error,stacktrace){
      emit(DetailFailed(message: error.toString()));
      print(error.toString()+stacktrace.toString());
    }
  }
}
