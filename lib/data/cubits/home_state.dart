part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class LoginInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeSucsess extends HomeState {}
final class HomeError extends HomeState {}

