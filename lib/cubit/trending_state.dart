part of 'trending_cubit.dart';

@immutable
abstract class TrendingState {}

class TrendingInitial extends TrendingState {}

class InitTrendingState extends TrendingState {}

class DownTrendingState extends TrendingState {}

class FailedTrendingState extends TrendingState {
  final String? message;
  FailedTrendingState({this.message});
}
