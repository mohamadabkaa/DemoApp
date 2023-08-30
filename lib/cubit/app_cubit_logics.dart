import 'package:demo_app/cubit/app_cubit.dart';
import 'package:demo_app/cubit/app_cubit_states.dart';
import 'package:demo_app/pages/detail_page.dart';
import 'package:demo_app/pages/home_page.dart';
import 'package:demo_app/pages/nevpages/main_page.dart';
import 'package:demo_app/pages/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitlogics extends StatefulWidget {
  const AppCubitlogics({Key?key}): super(key:key);

  @override
  State<AppCubitlogics> createState() => _AppCubitlogicsState();
}

class _AppCubitlogicsState extends State<AppCubitlogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocBuilder<AppCubits,CubitStates>(
        builder: (context,state){
          if (state is DetailState) {
            return DetailPage();
          } if (state is WelcomeState) {
            return WelcomePage();
          } if (state is LoadedState) {
            return MainPage();
          } if (state is LoadingState) {
            return Center(child:CircularProgressIndicator(),);
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
