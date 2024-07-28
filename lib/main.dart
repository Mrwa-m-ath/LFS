import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'MyBloc/Cubit.dart';
import 'MyBloc/Stat.dart';

import 'Page/HomeInformationpage.dart';

Future main() async {
  try {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD9ZtknvYh55suxLXhZ3VI-dbiG2CmUqng",
            authDomain: "latpro-315b7.firebaseapp.com",
            projectId: "latpro-315b7",
            storageBucket: "latpro-315b7.appspot.com",
            messagingSenderId: "28724327328",
            appId: "1:28724327328:web:154334e71047cee25aeac5",
            measurementId: "G-CRCEPB6HSY"));
  } on FirebaseException catch (e) {
    if (e.code == 'duplicate-app') {
      await Firebase.initializeApp();
    }
  }
  runApp(MyApp());

  await WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
   late TabController _tabController;
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MyCubit()
          ..GetData()
          ..AboutUs()
          ..News()
          ..GetDataAr(),
        child: BlocConsumer<MyCubit, MyStat>(
          listener: (context, state) {},
          builder: (context, state) =>
              LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return phoneT(context);
            } else {
              return DescT0p(context);
            }
          }),
        ));
  }
}

phoneT(context) => MaterialApp(
    localeResolutionCallback: (locale, supportedLocales) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale!.languageCode) {
          return supportedLocale;
        }
      }

      /// Se a localidade do dispositivo não for compatível, use o primeiro
      ///
      return supportedLocales.first;
    },
    locale: MyCubit.get(context).lasn == 'en' ? Locale('en') : Locale('ar'),
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,

      // GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      Locale('en'), // إضافة مفوضي الترجمة من flutter_localizations
      // GlobalMaterialLoca
      Locale('ar'),
    ],
    home: HomeInformationpage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.indigo.shade900, fill: 1),
        brightness: Brightness.light,
        primaryColor: Colors.cyan,
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.cyanAccent,
          width: 400,
        ),
        textTheme: TextTheme(
            displaySmall: TextStyle(
                color: Colors.black, fontSize: 9, fontWeight: FontWeight.w600)),
        primarySwatch: Colors.cyan,
        buttonBarTheme: ButtonBarThemeData(),
        textSelectionTheme: TextSelectionThemeData(),
        bottomAppBarTheme: BottomAppBarTheme(),
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 36, fontWeight: FontWeight.w500),
            backgroundColor: Colors.black45),
        tabBarTheme: TabBarTheme(
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.indigo.shade900,
            labelStyle: TextStyle(
                color: Colors.indigo.shade900,
                fontSize: 9,
                fontWeight: FontWeight.bold),
            dividerColor: Colors.indigo.shade900,
            labelColor: Colors.indigo.shade900,
            unselectedLabelStyle: TextStyle(
                color: Colors.black,
                fontSize: 9,
                fontWeight: FontWeight.w600))),
    themeMode: MyCubit.get(context).IsDark ? ThemeMode.dark : ThemeMode.light,
    darkTheme: ThemeData(
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.white60,
          width: 350,
        ),
        iconTheme: IconThemeData(color: Colors.indigo.shade900, fill: 1),
        textTheme: TextTheme(
            displaySmall: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600)),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.black45,
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w500)),
        scaffoldBackgroundColor: Colors.indigo.shade100,
        brightness: Brightness.dark,
        tabBarTheme: TabBarTheme(
            labelStyle: TextStyle(
                color: Colors.indigo.shade800,
                fontSize: 10,
                fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle: TextStyle(
                color: Colors.black38,
                fontSize: 9,
                fontWeight: FontWeight.w600)),
        primaryColor: Colors.cyan.shade800,
        primarySwatch: Colors.cyan,
        navigationDrawerTheme: NavigationDrawerThemeData()));

DescT0p(context) => MaterialApp(color: Colors.green.shade500,
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode) {
            return supportedLocale;
          }
        }

        /// Se a localidade do dispositivo não for compatível, use o primeiro
        ///
        return supportedLocales.first;
      },
      locale: MyCubit.get(context).lasn == 'en' ? Locale('en') : Locale('ar'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

        // GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // إضافة مفوضي الترجمة من flutter_localizations
        // GlobalMaterialLoca
        Locale('ar'),
      ],
      // builder: (context, child) => DefaultTabController(
      //   // child: Scaffold(backgroundColor: Colors.black.withOpacity(0.6),
      //     // appBar: AppBar(
      //     //   bottom: TabBar(
      //     //       splashBorderRadius: BorderRadius.circular(15),
      //     //       enableFeedback: true,
      //     //       dividerColor: Colors.cyan,
      //     //       indicatorColor: Colors.black,
      //     //       indicatorSize: TabBarIndicatorSize.label,
      //     //       tabAlignment: TabAlignment.center,
      //     //       labelPadding: EdgeInsetsDirectional.all(10),
      //     //       indicatorWeight: 1,
      //     //       dividerHeight: 0.2,
      //     //       tabs: [
      //     //         Padding(
      //     //           padding: const EdgeInsets.all(8.0),
      //     //           child: Tab(
      //     //               child: MyCubit.get(context).lasn == 'en'
      //     //                   ? Text('Mobevac .',
      //     //                       style: TextStyle(
      //     //                           color: Colors.white, fontSize: 13))
      //     //                   : Row(
      //     //                       children: [
      //     //                         Text('مببيفاك .',
      //     //                             style: TextStyle(
      //     //                                 color: Colors.white, fontSize: 13)),
      //     //                       ],
      //     //                     )),
      //     //         ),
      //     //         Padding(
      //     //           padding: const EdgeInsets.all(8.0),
      //     //           child: Tab(
      //     //             child: Text(
      //     //                 MyCubit.get(context).lasn == 'en'
      //     //                     ? 'Who we are'
      //     //                     : 'من نحن',
      //     //                 style: TextStyle(color: Colors.white, fontSize: 13)),
      //     //           ),
      //     //         ),
      //     //         Padding(
      //     //           padding: const EdgeInsets.all(8.0),
      //     //           child: Tab(
      //     //             child: DropdownButton2(
      //     //               alignment: Alignment.center,
      //     //               iconStyleData: IconStyleData(
      //     //                 iconEnabledColor: Colors.indigo.shade500,
      //     //                 iconSize: 30,
      //     //               ),
      //     //               underline: Text(''),
      //     //               barrierDismissible: true,
      //     //               style: Theme.of(context).textTheme.displaySmall,
      //     //               dropdownStyleData: DropdownStyleData(
      //     //                 useSafeArea: true,
      //     //                 maxHeight: 200,
      //     //                 width: 200,
      //     //                 decoration: BoxDecoration(
      //     //                     borderRadius: BorderRadius.circular(14),
      //     //                     color: Colors.indigo.shade50),
      //     //                 scrollbarTheme: ScrollbarThemeData(
      //     //                   radius: const Radius.circular(40),
      //     //                   thickness: MaterialStateProperty.all(6),
      //     //                   thumbVisibility: MaterialStateProperty.all(true),
      //     //                 ),
      //     //               ),
      //     //               items: [
      //     //                 DropdownMenuItem(
      //     //                   child: MaterialButton(
      //     //                       child: Text(
      //     //                           MyCubit.get(context).lasn == 'en'
      //     //                               ? 'Animal Health'
      //     //                               : 'صحة الحيوان',
      //     //                           style: Theme.of(context)
      //     //                               .textTheme
      //     //                               .displaySmall),
      //     //                       onPressed: () {
      //     //                         {
      //     //                           showDialog(
      //     //                             context: context,
      //     //                             builder: (context) => Product(),
      //     //                           );
      //     //                         }
      //     //                       }),
      //     //                   enabled: false,
      //     //                 ),
      //     //                 DropdownMenuItem(
      //     //                   child: MaterialButton(
      //     //                       child: Text(
      //     //                           MyCubit.get(context).lasn == 'en'
      //     //                               ? 'Pesticides'
      //     //                               : 'مبيدات حشرية',
      //     //                           style: Theme.of(context)
      //     //                               .textTheme
      //     //                               .displaySmall),
      //     //                       onPressed: () {}),
      //     //                   enabled: false,
      //     //                 ),
      //     //               ],
      //     //               value: null,
      //     //               onChanged: (s) {},
      //     //               hint: Text(
      //     //                   MyCubit.get(context).lasn == 'en'
      //     //                       ? 'What we do'
      //     //                       : 'الذي نفعله ',
      //     //                   style:
      //     //                       TextStyle(color: Colors.white, fontSize: 13)),
      //     //             ),
      //     //           ),
      //     //         ),
      //     //         Padding(
      //     //           padding: const EdgeInsets.all(8.0),
      //     //           child: Tab(
      //     //             child: Text(
      //     //                 MyCubit.get(context).lasn == 'en' ? 'News' : 'أخبار',
      //     //                 style: TextStyle(color: Colors.white, fontSize: 13)),
      //     //           ),
      //     //         ),
      //     //         Padding(
      //     //           padding: const EdgeInsets.all(8.0),
      //     //           child: Tab(
      //     //             child: DropdownButton2(
      //     //               isDense: true,
      //     //               underline: Text(''),
      //     //               alignment: Alignment.center,
      //     //               iconStyleData: IconStyleData(
      //     //                 iconEnabledColor: Colors.indigo.shade500,
      //     //                 iconSize: 30,
      //     //               ),
      //     //               barrierDismissible: true,
      //     //               style: TextStyle(
      //     //                   color: Colors.black,
      //     //                   fontSize: 15,
      //     //                   fontWeight: FontWeight.w600),
      //     //               buttonStyleData: ButtonStyleData(
      //     //                   decoration: BoxDecoration(
      //     //                       borderRadius: BorderRadius.circular(
      //     //                 0.1,
      //     //               ))),
      //     //               dropdownStyleData: DropdownStyleData(
      //     //                 useSafeArea: true,
      //     //                 maxHeight: 200,
      //     //                 width: 200,
      //     //                 decoration: BoxDecoration(
      //     //                     borderRadius: BorderRadius.circular(14),
      //     //                     color: Colors.indigo.shade50),
      //     //                 scrollbarTheme: ScrollbarThemeData(
      //     //                   radius: const Radius.circular(40),
      //     //                   thickness: MaterialStateProperty.all(6),
      //     //                   thumbVisibility: MaterialStateProperty.all(true),
      //     //                 ),
      //     //               ),
      //     //               items: [
      //     //                 DropdownMenuItem(
      //     //                   enabled: false,
      //     //                   child: ConditionalBuilder(
      //     //                     fallback: (context) => Center(
      //     //                       child: CircularProgressIndicator(),
      //     //                     ),
      //     //                     builder: (context) => TextButton(
      //     //                         child: Text('En',
      //     //                             style: Theme.of(context)
      //     //                                 .textTheme
      //     //                                 .displaySmall),
      //     //                         onPressed: () {
      //     //                           AnimationController? controller;
      //     //                           MyCubit.get(context)
      //     //                               .ChangLanguageToEnglish();
      //     //                         }),
      //     //                     condition: MyCubit.get(context).lasn == 'en',
      //     //                   ),
      //     //                 ),
      //     //                 DropdownMenuItem(
      //     //                   enabled: false,
      //     //                   child: TextButton(
      //     //                       child: Text('ar',
      //     //                           style: Theme.of(context)
      //     //                               .textTheme
      //     //                               .displaySmall),
      //     //                       onPressed: () {
      //     //                         MyCubit.get(context).ChangeLanguageToArabic();
      //     //                       }),
      //     //                 )
      //     //               ],
      //     //               value: null,
      //     //               onChanged: (s) {},
      //     //               hint: Text(
      //     //                   MyCubit.get(context).lasn == 'en'
      //     //                       ? 'Change Lan'
      //     //                       : 'تغيير اللغه ',
      //     //                   style:
      //     //                       TextStyle(color: Colors.white, fontSize: 13)),
      //     //             ),
      //     //           ),
      //     //         ),
      //     //       ]),
      //     //   actions: [
      //     //     Text(
      //     //       'Dark mode',
      //     //       style: TextStyle(color: Colors.black),
      //     //     ),
      //     //     Switch(
      //     //       focusColor: Colors.indigo.shade800,
      //     //       value: MyCubit.get(context).IsDark,
      //     //       onChanged: (value) {
      //     //         MyCubit.get(context).ChangeThemeDarkTOLight();
      //     //       },
      //     //     ),
      //     //     InkWell(
      //     //       child: Container(
      //     //           height: 40,
      //     //           decoration: BoxDecoration(
      //     //               borderRadius: BorderRadius.circular(25),
      //     //               color: Colors.white,
      //     //               border: Border.all(color: Colors.black45)),
      //     //           child: Padding(
      //     //             padding: const EdgeInsets.all(10.0),
      //     //             child: Row(
      //     //               children: [
      //     //                 Text(
      //     //                     MyCubit.get(context).lasn == 'en'
      //     //                         ? 'Country sites'
      //     //                         : 'موقعنا ',
      //     //                     style: TextStyle(
      //     //                       color: Colors.black,
      //     //                       fontSize: 13,
      //     //                     )),
      //     //                 Icon((Icons.location_on))
      //     //               ],
      //     //             ),
      //     //           )),
      //     //       onTap: () {
      //     //         MapsLauncher.launchQuery('مصنع مبيدكو');
      //     //       },
      //     //     ),
      //     //     SizedBox(
      //     //       width: 15,
      //     //     ),
      //     //     InkWell(
      //     //         child: Container(
      //     //             height: 40,
      //     //             decoration: BoxDecoration(
      //     //                 borderRadius: BorderRadius.circular(25),
      //     //                 color: Colors.white,
      //     //                 border: Border.all(color: Colors.black45)),
      //     //             child: Padding(
      //     //               padding: const EdgeInsets.all(10.0),
      //     //               child: Row(
      //     //                 children: [
      //     //                   Text(
      //     //                       MyCubit.get(context).lasn == 'en'
      //     //                           ? 'Contact Us'
      //     //                           : 'تواصل معنا',
      //     //                       style: TextStyle(
      //     //                         color: Colors.black,
      //     //                         fontSize: 13,
      //     //                       )),
      //     //                   Icon((Icons.phone))
      //     //                 ],
      //     //               ),
      //     //             )),
      //     //         onTap: () async {
      //     //           final call = Uri.parse('tel:+91 9830268966');
      //     //           if (await canLaunchUrl(call)) {
      //     //             launchUrl(call);
      //     //           } else {
      //     //             throw 'Could not launch $call';
      //     //           }
      //     //           ;
      //     //         })
      //     //   ],
      //     //   toolbarHeight: 200,
      //     //   title: Column(
      //     //     children: [
      //     //       Padding(
      //     //           padding: EdgeInsets.all(15.0),
      //     //           child: MyCubit.get(context).lasn == 'en'
      //     //               ? Container(
      //     //                   alignment: Alignment.topRight,
      //     //                   child: Row(
      //     //                     children: [
      //     //                       Text('M',
      //     //                           style: TextStyle(
      //     //                               color:
      //     //                                   Colors.deepPurple.withOpacity(0.9),
      //     //                               fontSize: 55,
      //     //                               fontFamily: GoogleFonts.mrDeHaviland()
      //     //                                   .fontFamily,
      //     //                               textBaseline: TextBaseline.ideographic,
      //     //                               fontWeight: FontWeight.bold)),
      //     //                       Text('obevac',
      //     //                           style: TextStyle(
      //     //                               color: Colors.black,
      //     //                               fontSize: 30,
      //     //                               fontWeight: FontWeight.bold))
      //     //                     ],
      //     //                   ),
      //     //                 )
      //     //               : Container(
      //     //                   alignment: Alignment.topRight,
      //     //                   child: Row(
      //     //                     children: [
      //     //                       Text('مــــ',
      //     //                           style: TextStyle(
      //     //                               color:
      //     //                                   Colors.deepPurple.withOpacity(0.9),
      //     //                               fontSize: 35,
      //     //                               fontFamily: GoogleFonts.mrDeHaviland()
      //     //                                   .fontFamily,
      //     //                               textBaseline: TextBaseline.ideographic,
      //     //                               fontWeight: FontWeight.bold)),
      //     //                       Text('ـوـبيفاك',
      //     //                           style: TextStyle(
      //     //                               color: Colors.black,
      //     //                               fontSize: 35,
      //     //                               fontFamily: GoogleFonts.mrDeHaviland()
      //     //                                   .fontFamily,
      //     //                               fontWeight: FontWeight.bold)),
      //     //                     ],
      //     //                   ),
      //     //                 )),
      //     //       SizedBox(
      //     //         width: 100,
      //     //       ),
      //     //       Container(
      //     //         alignment: Alignment.center,
      //     //         width: 600,
      //     //         decoration: BoxDecoration(
      //     //             color: Colors.black.withOpacity(0.3),
      //     //             borderRadius: BorderRadius.circular(15),
      //     //             border: Border.all(
      //     //                 color: Colors.white.withOpacity(0.7), width: 3)),
      //     //         child: TabBar(
      //     //             splashBorderRadius: BorderRadius.circular(15),
      //     //             enableFeedback: true,
      //     //             dividerColor: Colors.cyan,
      //     //             indicatorColor: Colors.black,
      //     //             indicatorSize: TabBarIndicatorSize.label,
      //     //             tabAlignment: TabAlignment.center,
      //     //             labelPadding: EdgeInsetsDirectional.all(10),
      //     //             indicatorWeight: 1,
      //     //             dividerHeight: 0.2,
      //     //             tabs: [
      //     //               Padding(
      //     //                 padding: const EdgeInsets.all(8.0),
      //     //                 child: Tab(
      //     //                     child: MyCubit.get(context).lasn == 'en'
      //     //                         ? Text('Mobevac .',
      //     //                             style: TextStyle(
      //     //                                 color: Colors.white, fontSize: 13))
      //     //                         : Row(
      //     //                             children: [
      //     //                               Text('مببيفاك .',
      //     //                                   style: TextStyle(
      //     //                                       color: Colors.white,
      //     //                                       fontSize: 13)),
      //     //                             ],
      //     //                           )),
      //     //               ),
      //     //               Padding(
      //     //                 padding: const EdgeInsets.all(8.0),
      //     //                 child: Tab(
      //     //                   child: Text(
      //     //                       MyCubit.get(context).lasn == 'en'
      //     //                           ? 'Who we are'
      //     //                           : 'من نحن',
      //     //                       style: TextStyle(
      //     //                           color: Colors.white, fontSize: 13)),
      //     //                 ),
      //     //               ),
      //     //               Padding(
      //     //                 padding: const EdgeInsets.all(8.0),
      //     //                 child: Tab(
      //     //                   child: DropdownButton2(
      //     //                     alignment: Alignment.center,
      //     //                     iconStyleData: IconStyleData(
      //     //                       iconEnabledColor: Colors.indigo.shade500,
      //     //                       iconSize: 30,
      //     //                     ),
      //     //                     underline: Text(''),
      //     //                     barrierDismissible: true,
      //     //                     style: Theme.of(context).textTheme.displaySmall,
      //     //                     dropdownStyleData: DropdownStyleData(
      //     //                       useSafeArea: true,
      //     //                       maxHeight: 200,
      //     //                       width: 200,
      //     //                       decoration: BoxDecoration(
      //     //                           borderRadius: BorderRadius.circular(14),
      //     //                           color: Colors.indigo.shade50),
      //     //                       scrollbarTheme: ScrollbarThemeData(
      //     //                         radius: const Radius.circular(40),
      //     //                         thickness: MaterialStateProperty.all(6),
      //     //                         thumbVisibility:
      //     //                             MaterialStateProperty.all(true),
      //     //                       ),
      //     //                     ),
      //     //                     items: [
      //     //                       DropdownMenuItem(
      //     //                         child: MaterialButton(
      //     //                             child: Text(
      //     //                                 MyCubit.get(context).lasn == 'en'
      //     //                                     ? 'Animal Health'
      //     //                                     : 'صحة الحيوان',
      //     //                                 style: Theme.of(context)
      //     //                                     .textTheme
      //     //                                     .displaySmall),
      //     //                             onPressed: () {
      //     //                               {
      //     //                                 showDialog(
      //     //                                   context: context,
      //     //                                   builder: (context) => Product(),
      //     //                                 );
      //     //                               }
      //     //                             }),
      //     //                         enabled: false,
      //     //                       ),
      //     //                       DropdownMenuItem(
      //     //                         child: MaterialButton(
      //     //                             child: Text(
      //     //                                 MyCubit.get(context).lasn == 'en'
      //     //                                     ? 'Pesticides'
      //     //                                     : 'مبيدات حشرية',
      //     //                                 style: Theme.of(context)
      //     //                                     .textTheme
      //     //                                     .displaySmall),
      //     //                             onPressed: () {}),
      //     //                         enabled: false,
      //     //                       ),
      //     //                     ],
      //     //                     value: null,
      //     //                     onChanged: (s) {},
      //     //                     hint: Text(
      //     //                         MyCubit.get(context).lasn == 'en'
      //     //                             ? 'What we do'
      //     //                             : 'الذي نفعله ',
      //     //                         style: TextStyle(
      //     //                             color: Colors.white, fontSize: 13)),
      //     //                   ),
      //     //                 ),
      //     //               ),
      //     //               Padding(
      //     //                 padding: const EdgeInsets.all(8.0),
      //     //                 child: Tab(
      //     //                   child: Text(
      //     //                       MyCubit.get(context).lasn == 'en'
      //     //                           ? 'News'
      //     //                           : 'أخبار',
      //     //                       style: TextStyle(
      //     //                           color: Colors.white, fontSize: 13)),
      //     //                 ),
      //     //               ),
      //     //               Padding(
      //     //                 padding: const EdgeInsets.all(8.0),
      //     //                 child: Tab(
      //     //                   child: DropdownButton2(
      //     //                     isDense: true,
      //     //                     underline: Text(''),
      //     //                     alignment: Alignment.center,
      //     //                     iconStyleData: IconStyleData(
      //     //                       iconEnabledColor: Colors.indigo.shade500,
      //     //                       iconSize: 30,
      //     //                     ),
      //     //                     barrierDismissible: true,
      //     //                     style: TextStyle(
      //     //                         color: Colors.black,
      //     //                         fontSize: 15,
      //     //                         fontWeight: FontWeight.w600),
      //     //                     buttonStyleData: ButtonStyleData(
      //     //                         decoration: BoxDecoration(
      //     //                             borderRadius: BorderRadius.circular(
      //     //                       0.1,
      //     //                     ))),
      //     //                     dropdownStyleData: DropdownStyleData(
      //     //                       useSafeArea: true,
      //     //                       maxHeight: 200,
      //     //                       width: 200,
      //     //                       decoration: BoxDecoration(
      //     //                           borderRadius: BorderRadius.circular(14),
      //     //                           color: Colors.indigo.shade50),
      //     //                       scrollbarTheme: ScrollbarThemeData(
      //     //                         radius: const Radius.circular(40),
      //     //                         thickness: MaterialStateProperty.all(6),
      //     //                         thumbVisibility:
      //     //                             MaterialStateProperty.all(true),
      //     //                       ),
      //     //                     ),
      //     //                     items: [
      //     //                       DropdownMenuItem(
      //     //                         enabled: false,
      //     //                         child: ConditionalBuilder(
      //     //                           fallback: (context) => Center(
      //     //                             child: CircularProgressIndicator(),
      //     //                           ),
      //     //                           builder: (context) => TextButton(
      //     //                               child: Text('En',
      //     //                                   style: Theme.of(context)
      //     //                                       .textTheme
      //     //                                       .displaySmall),
      //     //                               onPressed: () {
      //     //                                 AnimationController? controller;
      //     //                                 MyCubit.get(context)
      //     //                                     .ChangLanguageToEnglish();
      //     //                               }),
      //     //                           condition:
      //     //                               MyCubit.get(context).lasn == 'en',
      //     //                         ),
      //     //                       ),
      //     //                       DropdownMenuItem(
      //     //                         enabled: false,
      //     //                         child: TextButton(
      //     //                             child: Text('ar',
      //     //                                 style: Theme.of(context)
      //     //                                     .textTheme
      //     //                                     .displaySmall),
      //     //                             onPressed: () {
      //     //                               MyCubit.get(context)
      //     //                                   .ChangeLanguageToArabic();
      //     //                             }),
      //     //                       )
      //     //                     ],
      //     //                     value: null,
      //     //                     onChanged: (s) {},
      //     //                     hint: Text(
      //     //                         MyCubit.get(context).lasn == 'en'
      //     //                             ? 'Change Lan'
      //     //                             : 'تغيير اللغه ',
      //     //                         style: TextStyle(
      //     //                             color: Colors.white, fontSize: 13)),
      //     //                   ),
      //     //                 ),
      //     //               ),
      //     //             ]),
      //     //       ),
      //     //     ],
      //     //   ),
      //     // ),
      //     // body: isLoading
      //     //     ? Stack(children: [
      //     //         Container(
      //     //           child: TabBarView(children: [
      //     //             HomeInformationpage(),
      //     //             AboutUs(),
      //     //             Product(),
      //     //             ContactUs(),
      //     //             AboutUs(),
      //     //           ]),
      //     //         )
      //     //       ])
      //     //     : Center(
      //     //         child: CircularProgressIndicator(),
      //     //       ),
      //   ),
      //   length: 5,
      // ),
      home: HomeInformationpage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.indigo.shade900, fill: 1),
          brightness: Brightness.light,
          textTheme: TextTheme(
              displaySmall: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
          primaryColor: Colors.cyan,
          primarySwatch: Colors.cyan,
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 40, fontWeight: FontWeight.w500),
            backgroundColor: Colors.white,
          ),
          tabBarTheme: TabBarTheme(
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.indigo.shade900,
              labelStyle: TextStyle(
                  color: Colors.indigo.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              dividerColor: Colors.indigo.shade900,
              labelColor: Colors.indigo.shade900,
              unselectedLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600))),
      themeMode: MyCubit.get(context).IsDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(
        iconTheme: IconThemeData(color: Colors.indigo.shade900),
        textTheme: TextTheme(
            displaySmall: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.indigo.shade100,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w500)),
        scaffoldBackgroundColor: Colors.indigo.shade100,
        brightness: Brightness.dark,
        tabBarTheme: TabBarTheme(
            labelStyle: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.black38,
            unselectedLabelStyle: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600)),
        primaryColor: Colors.cyan.shade100,
        primarySwatch: Colors.grey,
      ),
    );
