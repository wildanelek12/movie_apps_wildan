import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_apps_wildan/model/comedy_response_model.dart';
import 'package:movie_apps_wildan/repository/repository_animate.dart';

part 'animate_state.dart';

class AnimateCubit extends Cubit<AnimateState> {
  AnimateCubit() : super(AnimateInitial());
  ComedyResponseModel? comedyResponseModel;
  getAnimate()async{
    try{
      emit(AnimateInitial());
      comedyResponseModel = await RepositoryAnimate.animate();
      emit(AnimateDown());
    }catch(error,stacktrace){
      emit(AnimateFailed(message: error.toString()));
      print(error.toString()+stacktrace.toString());
    }
  }
}
