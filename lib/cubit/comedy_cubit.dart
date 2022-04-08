import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_apps_wildan/model/comedy_response_model.dart';

import '../repository/repository_comedy.dart';

part 'comedy_state.dart';

class ComedyCubit extends Cubit<ComedyState> {
  ComedyCubit() : super(ComedyInitial());
  ComedyResponseModel? comedyResponseModel;
  getComedy() async{
    try{
      emit(ComedyInitial());
      comedyResponseModel = await RepositoryComedy.trending();
      emit(ComedyDown());
    }catch(error,stacktrace){
      emit(ComedyFailed(message: error.toString()));
      print(error.toString()+stacktrace.toString());
    }
  }
}
