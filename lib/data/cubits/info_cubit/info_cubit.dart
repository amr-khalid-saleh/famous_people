import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:t1/data/models/info_model.dart';
import 'package:t1/data/remote_data_source/info_request.dart';

part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit() : super(InfoInitial());
  InfoModel infoModel =InfoModel();
  getinfo({required num id})async{
   emit(InfoLoading());
   var response =await InfoRequest.getInfo(id: id);
   if(response!=null){
    infoModel = response;
    emit(InfoSucsess());
   }
   else {
     emit(InfoErorr());
   }
  }
}
