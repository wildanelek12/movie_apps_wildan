part of 'detail_cubit.dart';

@immutable
abstract class DetailState {}

class DetailInitial extends DetailState {}
class DetailDown extends DetailState {}
class DetailFailed extends DetailState {
  final String? message;
  DetailFailed({this.message});
}
