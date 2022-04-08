part of 'animate_cubit.dart';

@immutable
abstract class AnimateState {}

class AnimateInitial extends AnimateState {}
class AnimateDown extends AnimateState {}
class AnimateFailed extends AnimateState {
  String? message;
  AnimateFailed({
    this.message
});
}
