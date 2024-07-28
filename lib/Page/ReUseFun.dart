import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobex/MyBloc/Cubit.dart';
import 'package:mobex/MyBloc/Stat.dart';

class News extends StatelessWidget {
   const News({super.key});

   @override
   Widget build(BuildContext context) {
     return  BlocConsumer <MyCubit,MyStat>(builder: (context, state) => Scaffold(body:  Column(children: [],)), listener: (context, state) {

     },)  ;
   }
 }
