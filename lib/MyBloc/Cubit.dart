import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../Page/AboutUs.dart';
import '../Page/FireBaseCodes.dart';

import 'Stat.dart';



class MyCubit extends Cubit<MyStat> {
  MyCubit() : super(Initlaization());

  static MyCubit get(context) => BlocProvider.of(context);
  var lasn = 'en';
  bool isTextVisible = false;
void Visibla(){
  isTextVisible = !isTextVisible;
  emit(VisStat());
}
  void ChangeLanguageToArabic(context)async {

     lasn = 'ar';

     emit(changelas());
  }

  void ChangLanguageToEnglish( ) async{

    lasn = 'en';

    emit(changelass());
  }
  bool  IsDark=false;
void ChangeThemeDarkTOLight(){
  IsDark=!IsDark;
  emit(ChangeThemeDarkTOLightMyStat());
}
void OnPageChan(index){
  activP = index;
  emit(OnPageChanStat());
}
  void OnPageChans(index){
    index = activP;
    emit(OnPageChanStat());
  }


  Future<QuerySnapshot?>  GetData()async {
    var ListCo=await collectionReference.get();
    ListCo.docs.forEach((element) {


        ProductionList.add(element.data());
        emit(V());
      print( ProductionList);
    });

  }
  Future<QuerySnapshot?> GetDataAr()async {
    var ListCo=await collectionReferenceAr.get();
    ListCo.docs.forEach((element) {

emit(A());
        ProductionListAr.add(element.data());

      print( ProductionListAr);
    });



  }
  Future<QuerySnapshot?> AboutUs()async {
    var ListCo=await AboutUsColle.get();
     ListCo.docs.forEach((element) {
       emit(B());
        AboutListAr.add(element.data());

      print( AboutListAr);
    });












  }
  Future<QuerySnapshot?> News()async {
    var NewsList=await AcollectionNews.get();
    NewsList.docs.forEach((element) {
      emit(NewsMyStata());
      NewsMobeVac.add(element.data());

      print( NewsMobeVac);
    });












  }
}