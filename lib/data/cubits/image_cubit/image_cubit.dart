import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:t1/data/models/image_model.dart';
import 'package:t1/data/remote_data_source/image_request.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());
  static ImageCubit get(context)=>BlocProvider.of(context);
  ImageModel imageModel =ImageModel();
  getimage({required num id})async{
    emit(ImageLoading());
    var response =await ImageRequest.getImage(id: id);
    if(response!=null){
      imageModel = response;
      emit(ImageSucsess());
    }
    else {
      emit(ImageErorr());
    }
  }
}
