import 'package:bloc/bloc.dart';
import 'package:demo_app/cubit/app_cubit_states.dart';
import 'package:demo_app/services/data_services.dart';
import 'package:flutter/cupertino.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}):super(InitialState()){
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  Future<void> getData() async {
    try {
      emit(LoadedState(places));
      places = await data.getInfo();
      emit(LoadedState(places));
    }catch(e){
    }

  }

}