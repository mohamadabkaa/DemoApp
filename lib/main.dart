
import 'package:demo_app/Widgets/app_large_text.dart';
import 'package:demo_app/cubit/app_cubit.dart';
import 'package:demo_app/cubit/app_cubit_logics.dart';
import 'package:demo_app/pages/detail_page.dart';
import 'package:demo_app/pages/home_page.dart';
import 'package:demo_app/pages/welcome_page.dart';
import 'package:demo_app/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context)=>AppCubits(
          data:DataServices(),
        ),
        child:AppCubitlogics() ,
      )
    );
  }
}
