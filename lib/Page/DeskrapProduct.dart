// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'package:url_launcher/url_launcher.dart';
// import '../MyBloc/Cubit.dart';
// import '../MyBloc/Stat.dart';
// import 'AboutUs.dart';
// import 'FireBaseCodes.dart';
// import 'HomeInformationpage.dart';
// import 'News.dart';
// import 'Product.dart';
//
// class DeskreptionProduct extends StatefulWidget {
//   var index;
//   DeskreptionProduct({this.index});
//
//   @override
//   State<DeskreptionProduct> createState() => _DeskreptionProductState();
// }
//
// class _DeskreptionProductState extends State<DeskreptionProduct> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<MyCubit, MyStat>(
//       builder: (context, state) => DefaultTabController(
//         length: 4,
//         child: Scaffold(
//           appBar: AppBar(),
//           body: LayoutBuilder(builder: (context, constraints) {
//             if (constraints.maxWidth < 600) {
//               return Phone(context, widget);
//             } else {
//               return DeskTop(context, widget);
//             }
//           }),
//         ),
//       ),
//       listener: (context, state) {},
//     );
//   }
// }
//
// Widget DeskTop(context, widget) => Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: SingleChildScrollView(
//         physics: ScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         child: Column(
//
//           children: [
//             Container(
//               width: 900,
//               height: 80,
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(0.30),
//                   border: Border.all(color: Colors.indigo, width: 3)),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(      width: 150,
//                       decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.5),
//                           borderRadius: BorderRadius.circular(0.12)),
//                       child: InkWell(
//                         child: Text('MobeVace',  style: TextStyle(
//                             color: Colors.white, fontSize: 19)),
//                         onTap: () {
//                           Navigator.push(context,     MaterialPageRoute(
//                             builder: (context) => HomeInformationpage(),  ));
//
//                         },
//                       )),
//                   SizedBox(width: 12,),
//                   Container(  width: 150,
//                       decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.5),
//                           borderRadius: BorderRadius.circular(0.2)),
//                       child: InkWell(
//                         child: Text('Who We Are',  style: TextStyle(
//                             color: Colors.white, fontSize: 20)),
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => AboutUs(),
//                               ));
//                         },
//                       )),
//                   SizedBox(width: 12,),
//
//                   Container(  width: 150,
//                     child: DropdownButton2(
//                       alignment: Alignment.center,
//                       iconStyleData: IconStyleData(
//                         iconEnabledColor: Colors.indigo.shade500,
//                         iconSize: 30,
//                       ),
//                       underline: Text(''),
//                       barrierDismissible: true,
//                       style:
//                       Theme.of(context).textTheme.displaySmall,
//                       dropdownStyleData: DropdownStyleData(
//                         useSafeArea: true,
//                         maxHeight: 200,
//                         width: 200,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(14),
//                             color: Colors.indigo.shade50),
//                         scrollbarTheme: ScrollbarThemeData(
//                           radius: const Radius.circular(40),
//                           thickness: MaterialStateProperty.all(6),
//                           thumbVisibility:
//                           MaterialStateProperty.all(true),
//                         ),
//                       ),
//                       items: [
//                         DropdownMenuItem(
//                           child: MaterialButton(
//                               child: Text(
//                                   MyCubit.get(context).lasn == 'en'
//                                       ? 'Animal Health'
//                                       : 'صحة الحيوان',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .displaySmall),
//                               onPressed: () {
//                                 {
//                                   showDialog(
//                                     context: context,
//                                     builder: (context) => Product(),
//                                   );
//                                 }
//                               }),
//                           enabled: false,
//                         ),
//                         DropdownMenuItem(
//                           child: MaterialButton(
//                               child: Text(
//                                   MyCubit.get(context).lasn == 'en'
//                                       ? 'Pesticides'
//                                       : 'مبيدات حشرية',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .displaySmall),
//                               onPressed: () {}),
//                           enabled: false,
//                         ),
//                       ],
//                       value: null,
//                       onChanged: (s) {},
//                       hint: Text(
//                           MyCubit.get(context).lasn == 'en'
//                               ? 'What we do'
//                               : 'الذي نفعله ',
//                           style: TextStyle(
//                               color: Colors.white, fontSize: 20)),
//                     ),
//                   ),
//                   SizedBox(width: 12,),
//                   Container(  alignment:Alignment.center,width: 140,
//                       decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.5),
//                           borderRadius: BorderRadius.circular(0.2)),
//                       child: InkWell(
//                         child: Text('News',style: TextStyle(fontSize: 20,color: Colors.white),),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Newss(),
//                             )
//                             ,);
//                         },
//                       )),
//                   SizedBox(width: 12,),
//                   Container(    width: 150, child:   DropdownButton2(
//                     isDense: true,
//                     underline: Text(''),
//                     alignment: Alignment.center,
//                     iconStyleData: IconStyleData(
//                       iconEnabledColor: Colors.indigo.shade500,
//                       iconSize: 30,
//                     ),
//                     barrierDismissible: true,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w600),
//                     buttonStyleData: ButtonStyleData(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                               0.1,
//                             ))),
//                     dropdownStyleData: DropdownStyleData(
//                       useSafeArea: true,
//                       maxHeight: 200,
//                       width: 200,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(14),
//                           color: Colors.indigo.shade50),
//                       scrollbarTheme: ScrollbarThemeData(
//                         radius: const Radius.circular(40),
//                         thickness: MaterialStateProperty.all(6),
//                         thumbVisibility:
//                         MaterialStateProperty.all(true),
//                       ),
//                     ),
//                     items: [
//                       DropdownMenuItem(
//                         enabled: false,
//                         child: ConditionalBuilder(
//                           fallback: (context) => Center(
//                             child: CircularProgressIndicator(),
//                           ),
//                           builder: (context) => TextButton(
//                               child: Text('En',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .displaySmall),
//                               onPressed: () {
//                                 AnimationController? controller;
//                                 MyCubit.get(context)
//                                     .ChangLanguageToEnglish();
//                               }),
//                           condition:
//                           MyCubit.get(context).lasn == 'en',
//                         ),
//                       ),
//                       DropdownMenuItem(
//                         enabled: false,
//                         child: TextButton(
//                             child: Text('ar',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .displaySmall),
//                             onPressed: () {
//                               MyCubit.get(context)
//                                   .ChangeLanguageToArabic(context);
//                             }),
//                       )
//                     ],
//                     value: null,
//                     onChanged: (s) {},
//                     hint: Text(
//                         MyCubit.get(context).lasn == 'en'
//                             ? 'Change Lan'
//                             : 'تغيير اللغه ',
//                         style: TextStyle(
//                             color: Colors.white, fontSize: 20)),
//                   ),     ),     SizedBox(width: 12,),
//                 ],
//               ),
//             ),
//             Container(
//               decoration:
//                   BoxDecoration(color: Colors.indigoAccent.withOpacity(0.3)),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 100,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 400),
//                     child: Text(
//                         MyCubit.get(context).lasn == 'en'
//                             ? ProductionList[widget.index]['Name']
//                             : ProductionListAr[widget.index]['Name'],
//                         style: TextStyle(
//                           fontSize: 35,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: GoogleFonts.adamina().fontFamily,
//                         )),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Center(
//                       child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(9),
//                               border: Border.all(
//                                   color: Colors.indigo.shade900, width: 6)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Image(
//                               image: NetworkImage(
//                                   '${ProductionList[widget.index]['Image']}'),
//                               width: 600,
//                               height: 400,
//                               fit: BoxFit.contain,
//                             ),
//                           ))),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 150),
//                     child: InkWell(
//                         onTap: () {
//                           MyCubit.get(context).Visibla();
//                         },
//                         child: Row(
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 MyCubit.get(context).Visibla();
//                               },
//                               child: Icon(
//                                 MyCubit.get(context).isTextVisible
//                                     ? Icons.arrow_drop_up
//                                     : Icons.arrow_drop_down,
//                                 size: 40.0,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             TextButton(
//                               child: Text(
//                                 MyCubit.get(context).lasn == 'en'
//                                     ? '  description '
//                                     : '  الوصف',
//                                 style: TextStyle(
//                                     fontFamily: GoogleFonts.acme().fontFamily,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 22,
//                                     color: Colors.black),
//                               ),
//                               onPressed: () {
//                                 MyCubit.get(context).Visibla();
//                               },
//                             ),
//                           ],
//                         )),
//                   ),
//                   SizedBox(
//                     height: 22,
//                   ),
//                   MyCubit.get(context).lasn == 'en'
//                       ? Padding(
//                           padding: const EdgeInsets.only(left: 250),
//                           child: Visibility(
//                             visible: MyCubit.get(context).isTextVisible,
//                             child: Text(ProductionList[widget.index]['Desc'],
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily:
//                                       GoogleFonts.abhayaLibre().fontFamily,
//                                 )),
//                           ),
//                         )
//                       : Padding(
//                           padding: const EdgeInsets.only(right: 250),
//                           child: Visibility(
//                             visible: MyCubit.get(context).isTextVisible,
//                             child: Text(ProductionListAr[widget.index]['Desc'],
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily:
//                                       GoogleFonts.abhayaLibre().fontFamily,
//                                 )),
//                           ),
//                         ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   EndDrowerForComputer(context),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
// Widget Phone(context, widget) => Padding(
//     padding: const EdgeInsets.all(9.0),
//     child: SingleChildScrollView(
//         physics: ScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         child: Column(children: [
//           Container(
//             decoration:
//                 BoxDecoration(color: Colors.indigoAccent.withOpacity(0.3)),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 50,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 50),
//                     child: Text(
//                         MyCubit.get(context).lasn == 'en'
//                             ? ProductionList[widget.index]['Name']
//                             : ProductionListAr[widget.index]['Name'],
//                         style: TextStyle(
//                           fontSize: 35,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: GoogleFonts.adamina().fontFamily,
//                         )),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Center(
//                       child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(9),
//                               border: Border.all(
//                                   color: Colors.indigo.shade900, width: 6)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Image(
//                               image: NetworkImage(
//                                   '${ProductionList[widget.index]['Image']}'),
//                               width: 600,
//                               height: 400,
//                               fit: BoxFit.contain,
//                             ),
//                           ))),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 30),
//                     child: InkWell(
//                         onTap: () {
//                           MyCubit.get(context).Visibla();
//                         },
//                         child: Row(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 MyCubit.get(context).Visibla();
//                               },
//                               child: Icon(
//                                 MyCubit.get(context).isTextVisible
//                                     ? Icons.arrow_drop_up
//                                     : Icons.arrow_drop_down,
//                                 size: 50.0,
//                                 color: Colors.blue,
//                               ),
//                             ),
//                             TextButton(
//                               child: Text(
//                                 MyCubit.get(context).lasn == 'en'
//                                     ? '  description '
//                                     : '  الوصف ',
//                                 style: TextStyle(
//                                     fontFamily: GoogleFonts.acme().fontFamily,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 22,
//                                     color: Colors.black),
//                               ),
//                               onPressed: () {
//                                 MyCubit.get(context).Visibla();
//                               },
//                             )
//                           ],
//                         )),
//                   ),
//                   SizedBox(
//                     height: 11,
//                   ),
//                   MyCubit.get(context).lasn == 'en'
//                       ? Padding(
//                           padding: const EdgeInsets.only(left: 50),
//                           child: Visibility(
//                             visible: MyCubit.get(context).isTextVisible,
//                             child: Text(ProductionList[widget.index]['Desc'],
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: GoogleFonts.acme().fontFamily,
//                                 )),
//                           ),
//                         )
//                       : Padding(
//                           padding: const EdgeInsets.only(right: 50),
//                           child: Visibility(
//                             visible: MyCubit.get(context).isTextVisible,
//                             child: Text(ProductionListAr[widget.index]['Desc'],
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: GoogleFonts.acme().fontFamily,
//                                 )),
//                           ),
//                         ),
//                   SizedBox(
//                     height: 11,
//                   ),
//                   EdfDrowerForPhone(context)
//                 ]),
//           )
//         ])));
