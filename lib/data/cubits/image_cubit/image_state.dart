part of 'image_cubit.dart';

@immutable
sealed class ImageState {}

final class ImageInitial extends ImageState {}
final class ImageLoading extends ImageState {}
final class ImageSucsess extends ImageState {}
final class ImageErorr extends ImageState {}


