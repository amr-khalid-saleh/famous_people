import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:t1/data/models/home_screen_model.dart';
import 'package:t1/data/remote_data_source/home_request.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(LoginInitial());
  HomeScreenModel? homeScreenModel= HomeScreenModel();
  getData()async{
    emit(HomeLoading());
    var response =await HomeRequest.getData();
    if(response!=null){
      homeScreenModel =response;
      emit(HomeSucsess());
    }
    else{
      emit(HomeError());
    }
  }
}
