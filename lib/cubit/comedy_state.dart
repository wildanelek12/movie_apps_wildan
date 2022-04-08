part of 'comedy_cubit.dart';

@immutable
abstract class ComedyState {}

class ComedyInitial extends ComedyState {}
class ComedyDown extends ComedyState {}
class ComedyFailed extends ComedyState {
  final String? message;
  ComedyFailed({this.message});
}
