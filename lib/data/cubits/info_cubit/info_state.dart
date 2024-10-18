part of 'info_cubit.dart';

@immutable
sealed class InfoState {}

final class InfoInitial extends InfoState {}
final class InfoLoading extends InfoState {}
final class InfoSucsess extends InfoState {}
final class InfoErorr extends InfoState {}
