// import 'dart:async';
// import 'dart:ui';
//
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:maps_launcher/maps_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../MyBloc/Cubit.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
//
// import '../MyBloc/Stat.dart';
//
// import 'AboutUs.dart';
// import 'News.dart';
// import 'FireBaseCodes.dart';
// import 'HomeInformationpage.dart';
// import 'Product.dart';
//
// class HomeDesine extends StatefulWidget {
//   @override
//   State<HomeDesine> createState() => _HomeDesineState();
// }
//
// bool isLoading = false;
//
// class _HomeDesineState extends State<HomeDesine>
//     with SingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation<Offset> sliderAnimation;
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<MyCubit, MyStat>(
//       builder: (context, state) => LayoutBuilder(
//         builder: (context, constraints) {
//           if (constraints.maxWidth < 600) {
//             return _buildMobileLayout(context);
//           } else {
//             return _buildDesktopLayout(context);
//           }
//         },
//       ),
//       listener: (BuildContext context, MyStat state) {},
//     );
//   }
// }
//
//
// Widget _buildDesktopLayout(context) => DefaultTabController(
//     length: 5,
//     child: BlocConsumer<MyCubit, MyStat>(listener: (context, state) {},
//         builder: (context, state) => Scaffold(
//
//               body: NestedScrollView(
//                 headerSliverBuilder:
//                     (BuildContext context, bool innerBoxIsScrolled) {
//                   return <Widget>[
//                     SliverAppBar(excludeHeaderSemantics: true,stretch: true,automaticallyImplyLeading: false,
//
//                       actions: [
//                         Text(
//                           'Dark mode',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         Switch(
//                           focusColor: Colors.indigo.shade800,
//                           value: MyCubit.get(context).IsDark,
//                           onChanged: (value) {
//                             MyCubit.get(context).ChangeThemeDarkTOLight();
//                           },
//                         ),
//                         InkWell(
//                           child: Container(
//                               height: 40,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(25),
//                                   color: Colors.white,
//                                   border: Border.all(color: Colors.black45)),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                         MyCubit.get(context).lasn == 'en'
//                                             ? 'Country sites'
//                                             : 'موقعنا ',
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                         )),
//                                     Icon((Icons.location_on))
//                                   ],
//                                 ),
//                               )),
//                           onTap: () {
//                             MapsLauncher.launchQuery('مصنع مبيدكو');
//                           },
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         InkWell(
//                             child: Container(
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(25),
//                                     color: Colors.white,
//                                     border: Border.all(color: Colors.black45)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: Row(
//                                     children: [
//                                       Text(
//                                           MyCubit.get(context).lasn == 'en'
//                                               ? 'Contact Us'
//                                               : 'تواصل معنا',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 13,
//                                           )),
//                                       Icon((Icons.phone))
//                                     ],
//                                   ),
//                                 )),
//                             onTap: () async {
//                               final call = Uri.parse('tel:+91 9830268966');
//                               if (await canLaunchUrl(call)) {
//                                 launchUrl(call);
//                               } else {
//                                 throw 'Could not launch $call';
//                               }
//                               ;
//                             })
//                       ],
//                       toolbarHeight: 200,
//                       title: Column(
//                         children: [
//                           Padding(
//                               padding: EdgeInsets.all(15.0),
//                               child: MyCubit.get(context).lasn == 'en'
//                                   ? Container(
//                                       alignment: Alignment.topRight,
//                                       child: Row(
//                                         children: [
//                                           Text('M',
//                                               style: TextStyle(
//                                                   color: Colors.deepPurple
//                                                       .withOpacity(0.9),
//                                                   fontSize: 55,
//                                                   fontFamily:
//                                                       GoogleFonts.mrDeHaviland()
//                                                           .fontFamily,
//                                                   textBaseline:
//                                                       TextBaseline.ideographic,
//                                                   fontWeight: FontWeight.bold)),
//                                           Text('obevac',
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 30,
//                                                   fontWeight: FontWeight.bold))
//                                         ],
//                                       ),
//                                     )
//                                   : Container(
//                                       alignment: Alignment.topRight,
//                                       child: Row(
//                                         children: [
//                                           Text('مــــ',
//                                               style: TextStyle(
//                                                   color: Colors.deepPurple
//                                                       .withOpacity(0.9),
//                                                   fontSize: 35,
//                                                   fontFamily:
//                                                       GoogleFonts.mrDeHaviland()
//                                                           .fontFamily,
//                                                   textBaseline:
//                                                       TextBaseline.ideographic,
//                                                   fontWeight: FontWeight.bold)),
//                                           Text('ـوـبيفاك',
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 35,
//                                                   fontFamily:
//                                                       GoogleFonts.mrDeHaviland()
//                                                           .fontFamily,
//                                                   fontWeight: FontWeight.bold)),
//                                         ],
//                                       ),
//                                     )),
//                           SizedBox(
//                             width: 100,
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ];
//                 },
//                 body: isLoading
//                     ? Stack(children: [
//                         Container(
//                           child: TabBarView(children: [
//                             HomeInformationpage(),
//                             AboutUs(),
//                             Product(),
//                             Newss(),
//                             AboutUs(),
//                           ]),
//                         )
//                       ])
//                     : Center(
//                         child: CircularProgressIndicator(),
//                       ),
//               ),
//             ),
// ));
//
// Widget _buildMobileLayout(context) => DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         drawerEnableOpenDragGesture: true,
//         // drawer: Container(width: 300,height: 600,decoration: BoxDecoration( color: Colors.indigoAccent.shade100, border: Border.all(color: Colors.indigo.shade50,width: 6)),),drawerEdgeDragWidth: 150,drawerEnableOpenDragGesture: false,
//
//         body: isLoading
//             ? Stack(children: [
//                 Container(
//                   child: TabBarView(children: [
//                     HomeInformationpage(),
//                     AboutUs(),
//                     Product(),
//                     Newss(),
//                     AboutUs(),
//                   ]),
//                 )
//               ])
//             : Center(
//                 child: CircularProgressIndicator(),
//               ),
//       ),
//     );
// late TabController _tabController;