import 'dart:async';
import 'dart:js';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:maps_launcher/maps_launcher.dart';
import 'package:mobex/MyBloc/Cubit.dart';
import 'package:mobex/MyBloc/Stat.dart';

import 'package:url_launcher/url_launcher.dart';

import 'AboutUs.dart';
import 'News.dart';
import 'FireBaseCodes.dart';
import 'Product.dart';
import 'package:countup/countup.dart';

bool? _scrollListener(ScrollNotification scrollInfo) {
  if (scrollInfo.metrics.axis == Axis.vertical) {
    _ColorAnimationController!.animateTo(scrollInfo.metrics.pixels / 350);

    _TextAnimationController!.animateTo((scrollInfo.metrics.pixels - 350) / 50);
    return true;
  }
  // _tabController = new TabController(vsync: this, length: 3);
  // tabController = new TabController(vsync: this, length: 3);
}

class HomeInformationpage extends StatefulWidget {
  const HomeInformationpage({super.key});

  @override
  State<HomeInformationpage> createState() => _HomeInformationpageState();
}

late TabController _tabController;
late TabController tabController;
bool isLoading = false;
AnimationController? _ColorAnimationController;
AnimationController? _TextAnimationController;
Animation? _colorTween, _iconColorTween;
Animation<Offset>? _transTween;

class _HomeInformationpageState extends State<HomeInformationpage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    _ColorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Color(0xFFee4c4f))
        .animate(_ColorAnimationController!);
    _iconColorTween = ColorTween(begin: Colors.grey, end: Colors.white)
        .animate(_ColorAnimationController!);

    _TextAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
        .animate(_TextAnimationController!);

    super.initState();

    new Future.delayed(
        const Duration(seconds: 3),
        () => Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, MyStat>(
        listener: (context, state) {},
        builder: (context, state) =>
            LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth < 800) {
                return phone(context);
              } else {
                return Des(context);
              }
            }));
  }
}

int counter = 0;
bool loading = true;

Widget SliderName2(context) => ListWheelScrollView(
    itemExtent: 650,
    diameterRatio: 6,
    magnification: 1.5,
    children: List.generate(ImageLstTowContwe.length,
        (index) => Cara(ImageLstTowContwe[index], context)));
Widget SliderName3(context) => ListWheelScrollView(
      itemExtent: 400,
      diameterRatio: 2,
      children: List.generate(ImageLstTowContwe.length,
          (index) => PhomeCre(ImageLstTowContwe[index], context)),
    );
Widget ImageS(HomeIn homeL, context) => Column(children: [
      Expanded(
        child: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Image(
                image: AssetImage(homeL.ImagH),
                fit: BoxFit.cover,
                alignment: Alignment.center,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: homeL.bottom, bottom: homeL.paR),
                    child: Text(
                        MyCubit.get(context).lasn == 'en'
                            ? homeL.TitH
                            : homeL.TitHa,
                        style: TextStyle(
                            color: Colors.indigo.shade900, fontSize: 40)),
                  ))
            ],
          ),
        ),
      ),
    ]);
bool _loading = false;
var w;
var h;
Widget Des(context) => NotificationListener<ScrollNotification>(
      child: Animate(
          effects: [
            ShimmerEffect(
              duration: Duration(seconds: 5),
            ),
          ],
          child: Scaffold(backgroundColor:Colors.black,
            appBar: MediaQuery.of(context).size.width < 911
                ? ReUseAppBarPhone(context, Col: Colors.orange.shade400)
                : AppBar(
                    toolbarHeight: 100,
                    backgroundColor: Colors.orange.shade400,
                    automaticallyImplyLeading: false,
                    actions: [
                      Text(
                        'Dark mode',
                        style: TextStyle(color: Colors.white),
                      ),
                      Switch(
                        focusColor: Colors.indigo.shade800,
                        value: MyCubit.get(context).IsDark,
                        onChanged: (value) {
                          MyCubit.get(context).ChangeThemeDarkTOLight();
                        },
                      ),
                      InkWell(
                        child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                border: Border.all(color: Colors.black45)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Text(
                                      MyCubit.get(context).lasn == 'en'
                                          ? 'Country sites'
                                          : 'موقعنا ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      )),
                                  Icon((Icons.location_on))
                                ],
                              ),
                            )),
                        onTap: () {
                          MapsLauncher.launchQuery('مصنع مبيدكو');
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black45)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Text(
                                        MyCubit.get(context).lasn == 'en'
                                            ? 'Contact Us'
                                            : 'تواصل معنا',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                        )),
                                    Icon((Icons.phone))
                                  ],
                                ),
                              )),
                          onTap: () async {
                            final call = Uri.parse('tel:+91 9830268966');
                            if (await canLaunchUrl(call)) {
                              launchUrl(call);
                            } else {
                              throw 'Could not launch $call';
                            }
                            ;
                          })
                    ],
                    title: Container(
                        width: 600,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HomeInformationpage(),
                                      ));
                                },
                                child: MyCubit.get(context).lasn == 'en'
                                    ? Text('Mobevac',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold))
                                    : Text('مـبيفاك',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                child: Text(
                                    MyCubit.get(context).lasn == 'en'
                                        ? 'Who We Are'
                                        : 'من نحن ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AboutUs(),
                                      ));
                                },
                              ),
                            ),
                            DropdownButton2(
                              alignment: Alignment.center,
                              iconStyleData: IconStyleData(
                                iconEnabledColor: Colors.black,
                                iconSize: 20,
                              ),
                              underline: Text(''),
                              barrierDismissible: true,
                              style: Theme.of(context).textTheme.displaySmall,
                              dropdownStyleData: DropdownStyleData(
                                useSafeArea: true,
                                maxHeight: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.indigo.shade50),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness: MaterialStateProperty.all(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all(true),
                                ),
                              ),
                              items: [
                                DropdownMenuItem(
                                  child: MaterialButton(
                                      child: Text(
                                          MyCubit.get(context).lasn == 'en'
                                              ? 'Animal Health'
                                              : 'صحة الحيوان',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall),
                                      onPressed: () {
                                        {
                                          showDialog(
                                            context: context,
                                            builder: (context) => Product(),
                                          );
                                        }
                                      }),
                                  enabled: false,
                                ),
                                DropdownMenuItem(
                                  child: MaterialButton(
                                      child: Text(
                                          MyCubit.get(context).lasn == 'en'
                                              ? 'Pesticides'
                                              : 'مبيدات حشرية',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall),
                                      onPressed: () {}),
                                  enabled: false,
                                ),
                              ],
                              value: null,
                              onChanged: (s) {},
                              hint: Text(
                                  MyCubit.get(context).lasn == 'en'
                                      ? 'What we do'
                                      : 'الذي نفعله ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(0.2)),
                                    child: InkWell(
                                      child: Text(
                                          MyCubit.get(context).lasn == 'en'
                                              ? 'News'
                                              : 'اخبار',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Newss(),
                                          ),
                                        );
                                      },
                                    )),
                              ),
                            ),
                            Expanded(
                                child: DropdownButton2(
                              isDense: true,
                              underline: Text(''),
                              alignment: Alignment.center,
                              iconStyleData: IconStyleData(
                                iconEnabledColor: Colors.black,
                                iconSize: 20,
                              ),
                              barrierDismissible: true,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                              buttonStyleData: ButtonStyleData(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                0.1,
                              ))),
                              dropdownStyleData: DropdownStyleData(
                                useSafeArea: true,
                                maxHeight: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.indigo.shade50),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness: MaterialStateProperty.all(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all(true),
                                ),
                              ),
                              items: [
                                DropdownMenuItem(
                                  enabled: false,
                                  child: ConditionalBuilder(
                                    fallback: (context) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    builder: (context) => TextButton(
                                        child: Text('En',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall),
                                        onPressed: () {
                                          MyCubit.get(context)
                                              .ChangLanguageToEnglish();
                                        }),
                                    condition: true,
                                  ),
                                ),
                                DropdownMenuItem(
                                  enabled: false,
                                  child: TextButton(
                                      child: Text('ar',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall),
                                      onPressed: () {
                                        MyCubit.get(context)
                                            .ChangeLanguageToArabic(context);
                                      }),
                                )
                              ],
                              value: null,
                              onChanged: (s) {},
                              hint: Text(
                                  MyCubit.get(context).lasn == 'en'
                                      ? '  Language'
                                      : 'تغيير اللغه ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ))
                          ],
                        )),
                  ),
            drawer: MediaQuery.of(context).size.width < 911
                ? ReUserDro(context)
                : null,
            drawerEdgeDragWidth: 1,
            body: NestedScrollView(
              floatHeaderSlivers: true,
              body: SingleChildScrollView(
                clipBehavior: Clip.antiAlias,
                physics: AlwaysScrollableScrollPhysics(),
                dragStartBehavior: DragStartBehavior.start,
                primary: true,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.orange.shade500,
                            border: Border.all(
                              color: Colors.orange.shade500,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 11,
                              ),
                              Animate(
                                autoPlay: true,
                                effects: [
                                  ScaleEffect(
                                      duration: Duration(seconds: 4),
                                      begin: Offset(0.1, 0.9)),
                                ],
                                //   RotateEffect(duration: Duration(seconds:3)),FadeEffect(duration: Duration(seconds: 2)), ScaleEffect(duration: Duration(seconds: 3))],

                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 600,
                                    decoration: BoxDecoration(
                                        color: Colors.orange.shade500,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://images.unsplash.com/photo-1560179707-f14e90ef3623?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y29tcGFueXxlbnwwfHwwfHx8MA%3D%3D'))),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 60,
                                        ),
                                        AnimatedSwitcher(
                                          duration: Duration(milliseconds: 15),
                                          child: Container(
                                            alignment: Alignment.bottomCenter,
                                            height: 400,
                                            width: 400,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    left: BorderSide(
                                                        color: Colors
                                                            .orange.shade600,
                                                        width: 9),
                                                    right: BorderSide(
                                                        color: Colors
                                                            .orange.shade600,
                                                        width: 9),
                                                    top: BorderSide(
                                                        color: Colors
                                                            .orange.shade600,
                                                        width: 9))),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                DefaultTextStyle(
                                                  style: TextStyle(
                                                    fontFamily: GoogleFonts
                                                            .arbutusSlab()
                                                        .fontFamily,
                                                    color:
                                                        Colors.orange.shade200,
                                                    wordSpacing: 4,
                                                    fontSize: 60.0,
                                                  ),
                                                  child: AnimatedTextKit(
                                                    isRepeatingAnimation: true,
                                                    animatedTexts: [
                                                      RotateAnimatedText(
                                                        'MOBEVAC',
                                                        duration: Duration(
                                                            seconds: 3),
                                                        rotateOut: false,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                DefaultTextStyle(
                                                  softWrap: true,
                                                  style: TextStyle(
                                                    fontFamily: GoogleFonts
                                                            .hindMadurai()
                                                        .fontFamily,
                                                    color:
                                                        Colors.orange.shade500,
                                                    fontSize: 40.0,
                                                  ),
                                                  child: AnimatedTextKit(
                                                    animatedTexts: [
                                                      RotateAnimatedText(
                                                        ' W   e   l   c   o   m   e',
                                                        duration: Duration(
                                                            seconds: 3),
                                                        rotateOut: false,
                                                      ),
                                                    ],
                                                    onTap: () {
                                                      print("Tap Event");
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.orange.shade500,
                              border: Border.all(
                                color: Colors.orange.shade500,
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 90,
                              ),
                              Padding(
                                padding: EdgeInsets.all(13.0),
                                child: Text(
                                    MyCubit.get(context).lasn == 'en'
                                        ? 'Better health for your animals is within our reach every day.?'
                                        : 'صحة أفضل لحيواناتك في متناول أيدينا  كل يوم ',
                                    style: TextStyle(
                                        fontSize: 50,
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.akshar().fontFamily,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 150),
                                child: Text(
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black54,
                                        fontFamily:
                                            GoogleFonts.akshar().fontFamily,
                                        fontWeight: FontWeight.w100),
                                    'By creating high-quality products and making them accessible to those who need them, we are helping to shape a healthier world that enriches all our communities'
                                    ' Who we are Investors'),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => AboutUs(),
                                            ));
                                      },
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        width: 200,
                                        height: 55,
                                        decoration: BoxDecoration(
                                            color: Colors.orange.shade200,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                                child: Text(
                                              MyCubit.get(context).lasn == 'en'
                                                  ? 'Who we are'
                                                  : 'من نحن',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 23),
                                            )),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_up_rounded,
                                              color: Colors.black,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: InkWell(
                                      onTap: () async {
                                        final call =
                                            Uri.parse('tel:+91 9830268966');
                                        if (await canLaunchUrl(call)) {
                                          launchUrl(call);
                                        } else {
                                          throw 'Could not launch $call';
                                        }
                                      },
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        width: 200,
                                        height: 55,
                                        decoration: BoxDecoration(
                                            color: Colors.orange.shade200,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                                child: Text(
                                              MyCubit.get(context).lasn == 'en'
                                                  ? 'Contact Us'
                                                  : 'تواصل معنا ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 23),
                                            )),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Icon(
                                              Icons.phone_android_outlined,
                                              color: Colors.black,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 100,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding:   EdgeInsets.all(60.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.black12,border: Border.all(  color: Colors.orange.shade900, width: 2),
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text('Latest news',
                                    style: TextStyle(
                                        color: Colors.orange.shade900,
                                        fontFamily:
                                        GoogleFonts. abel().fontFamily,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(width: 35),
                              Icon(
                                Icons.arrow_downward,
                                color: Colors.orange.shade900,
                                size: 22,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                               decoration: BoxDecoration(   color: Colors.black12 ,borderRadius: BorderRadius.circular(5)),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      GridView.count(
                                          shrinkWrap: true,
                                          crossAxisSpacing: 1,
                                          mainAxisSpacing: 1,
                                          childAspectRatio: 1.9 / 2.1,
                                          physics: ScrollPhysics(),
                                          crossAxisCount:
                                              MediaQuery.of(context).size.width >
                                                      1200
                                                  ? 3
                                                  : 2,
                                          children: List.generate(
                                              NewsMobeVac.length,growable: true,
                                              // MyCubit.get(context).lasn=='en'?     ProductionList.length:     ProductionList.length,

                                              (index) => pcLastNews(
                                                  NewsMobeVac[index ],
                                                  context,
                                                  index ))),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding:   EdgeInsets.all(60.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.black12,border: Border.all(  color: Colors.orange.shade900, width: 2),
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text('About our work',
                                    style: TextStyle(
                                        color: Colors.orange.shade900,
                                        fontFamily:
                                        GoogleFonts. abel().fontFamily,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(width: 35),
                              Icon(
                                Icons.arrow_downward,
                                color: Colors.orange.shade900,
                                size: 22,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 111,
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 5), // فترة زمنية للتأثير
                        width: MediaQuery.of(context)
                            .size
                            .width, // عرض يأخذ حجم الشاشة بالكامل
                        height: MediaQuery.of(context)
                            .size
                            .height, // ارتفاع يأخذ حجم الشاشة بالكامل
                        color: Colors.orange.withOpacity(0.3),
                        child: Animate(
                            effects: [
                              FlipEffect(duration: Duration(seconds: 2))
                            ],
                            child: Container(
                                alignment: Alignment.topCenter,
                         
                                width: double.infinity,
                                height: 750,
                                child: SliderName2(context))),
                      ),
                      SizedBox(
                        height: 111,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 1200,
                                  color: Colors.black12,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.all(0.1),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 6,
                                            color: Colors.orange.shade400,
                                          ),

                                          borderRadius:
                                              BorderRadius.circular(0.5)),
                                      height: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                  Icon(
                                                    Icons.agriculture,
                                                    size: 70 ,color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        MyCubit.get(context)
                                                                    .lasn ==
                                                                'en'
                                                            ? 'Agricultural Pesticides'
                                                            : ' المبيدات الزراعية ',
                                                        style: TextStyle(
                                                            color: Colors.white,

                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(height: 15),
                                                      Countup(
                                                        begin: 0,
                                                        end: 100,
                                                        duration: Duration(
                                                            seconds: 400),
                                                        separator: ' ',
                                                        style: TextStyle(
                                                            fontSize: 36,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          color: Colors.white,),
                                                      ),
                                                    ],
                                                  ),
                                                ])),
                                            Expanded(
                                                child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.countertops,color: Colors.white,
                                                  size: 70,
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      MyCubit.get(context)
                                                                  .lasn ==
                                                              'en'
                                                          ? 'Countries'
                                                          : ' بلدان ',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(height: 15),
                                                    Countup(
                                                      begin: 0,
                                                      end: 60,
                                                      duration: Duration(
                                                          seconds: 100),
                                                      separator: ',',
                                                      style: TextStyle(
                                                          fontSize: 36,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        color: Colors.white,),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                            Expanded(
                                                child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.timeline_outlined,
                                                  size: 70,color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      MyCubit.get(context)
                                                                  .lasn ==
                                                              'en'
                                                          ? 'Establishment Date'
                                                          : ' تاريخ الإنشاء',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(height: 15),
                                                    Countup(
                                                      begin: 0,
                                                      end: 2024,
                                                      duration:
                                                          Duration(minutes: 1),
                                                      separator: ' ',
                                                      style: TextStyle(
                                                          fontSize: 36,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        color: Colors.white,),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      EndDrowerForComputer(context)
                    ]),
              ),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[];
              },
            ),
          )),
    );
List Textt = ['sdas', 'sadsad', 'wef'];

Widget phone(context) => DefaultTabController(
      initialIndex: 1, //optional, starts from 0, select the tab by default
      length: 3,
      child: Animate(
        effects: [
          ShimmerEffect(
              duration: Duration(seconds: 10),
              delay: Duration(seconds: 3),
              stops: [0.3, 0.6, 0.9])
        ],
        child: Scaffold(backgroundColor: Colors.black,
          endDrawerEnableOpenDragGesture: true,
          drawerEnableOpenDragGesture: true,
          appBar: ReUseAppBarPhone(context, Col: Colors.orange.shade600),
          drawer: ReUserDro(context),
          drawerEdgeDragWidth: 1,
          body: SingleChildScrollView(
            primary: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          border: Border.all(
                            color: Colors.orange.shade900,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 11,
                            ),
                            Animate(
                              autoPlay: true,
                              effects: [
                                ScaleEffect(
                                    duration: Duration(seconds: 4),
                                    begin: Offset(0.1, 0.9)),
                              ],
                              //   RotateEffect(duration: Duration(seconds:3)),FadeEffect(duration: Duration(seconds: 2)), ScaleEffect(duration: Duration(seconds: 3))],

                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 600,
                                  decoration: BoxDecoration(
                                      color: Colors.orange.shade500,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://images.unsplash.com/photo-1560179707-f14e90ef3623?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y29tcGFueXxlbnwwfHwwfHx8MA%3D%3D'))),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 60,
                                      ),
                                      AnimatedSwitcher(
                                        duration: Duration(milliseconds: 15),
                                        child: Container(
                                          alignment: Alignment.bottomCenter,
                                          height: 400,
                                          width: 400,
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  left: BorderSide(
                                                      color: Colors.white
                                                          .withOpacity(0.4),
                                                      width: 9),
                                                  right: BorderSide(
                                                      color: Colors.white
                                                          .withOpacity(0.4),
                                                      width: 9),
                                                  top: BorderSide(
                                                      color: Colors.white
                                                          .withOpacity(0.4),
                                                      width: 9))),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              DefaultTextStyle(
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.arbutusSlab()
                                                          .fontFamily,
                                                  color: Colors.white,
                                                  wordSpacing: 4,
                                                  fontSize: 60.0,
                                                ),
                                                child: AnimatedTextKit(
                                                  isRepeatingAnimation: true,
                                                  animatedTexts: [
                                                    RotateAnimatedText(
                                                      'MOBEVAC',
                                                      duration:
                                                          Duration(seconds: 3),
                                                      rotateOut: false,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              DefaultTextStyle(
                                                softWrap: true,
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.hindMadurai()
                                                          .fontFamily,
                                                  color: Colors.white,
                                                  fontSize: 40.0,
                                                ),
                                                child: AnimatedTextKit(
                                                  animatedTexts: [
                                                    RotateAnimatedText(
                                                      ' W   e   l   c   o   m   e',
                                                      duration:
                                                          Duration(seconds: 3),
                                                      rotateOut: false,
                                                    ),
                                                  ],
                                                  onTap: () {
                                                    print("Tap Event");
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 90,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                      MyCubit.get(context).lasn == 'en'
                                          ? 'Better health for your animals is within our reach every day.?'
                                          : 'صحة أفضل لحيواناتك في متناول أيدينا  كل يوم ',
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontFamily:
                                              GoogleFonts.akshar().fontFamily,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 80),
                                  child: Text(
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontFamily:
                                              GoogleFonts.akshar().fontFamily,
                                          fontWeight: FontWeight.w100),
                                      'By creating high-quality products and making them accessible to those who need them, we are helping to shape a healthier world that enriches all our communities'
                                      ' Who we are Investors'),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => AboutUs(),
                                              ));
                                        },
                                        child: Container(
                                          alignment: Alignment.topCenter,
                                          width: 150,
                                          height: 55,
                                          decoration: BoxDecoration(
                                              color: Colors.orange.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                  child: Text(
                                                MyCubit.get(context).lasn ==
                                                        'en'
                                                    ? 'Who we are'
                                                    : 'من نحن',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              )),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_up_rounded,
                                                color: Colors.black,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: InkWell(
                                        onTap: () async {
                                          final call =
                                              Uri.parse('tel:+91 9830268966');
                                          if (await canLaunchUrl(call)) {
                                            launchUrl(call);
                                          } else {
                                            throw 'Could not launch $call';
                                          }
                                        },
                                        child: Container(
                                          alignment: Alignment.topCenter,
                                          width: 200,
                                          height: 55,
                                          decoration: BoxDecoration(
                                              color: Colors.orange.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                  child: Text(
                                                MyCubit.get(context).lasn ==
                                                        'en'
                                                    ? 'Contact Us'
                                                    : 'تواصل معنا ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              )),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Icon(
                                                Icons.phone_android_outlined,
                                                color: Colors.black,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Latest news',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                    color: Colors.orange,
                                    child: GridView.count(
                                        shrinkWrap: true,
                                        crossAxisSpacing: 1,
                                        mainAxisSpacing: 1,
                                        childAspectRatio:
                                            MediaQuery.of(context).size.width <
                                                    650
                                                ? 1.9 / 2.2
                                                : 1.9 / 2.9,
                                        physics: ScrollPhysics(),
                                        crossAxisCount:
                                            MediaQuery.of(context).size.width <
                                                    650
                                                ? 1
                                                : 2,
                                        children: List.generate(
                                            NewsMobeVac.length,

growable: false,
                                            (index) => pcLastNews(
                                                NewsMobeVac[index],
                                                context,
                                                index)))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                            alignment: Alignment.center,
                            width: 350,
                            height: 400,
                            decoration: BoxDecoration(border:Border.all(color:Colors.orange.shade600),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 250,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Icon(
                                          Icons.agriculture,
                                          size: 60,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            MyCubit.get(context).lasn == 'en'
                                                ? 'Agricultural Pesticides'
                                                : ' المبيدات الزراعية ',
                                            style: TextStyle(
                                                color: Colors.orange.shade900,
                                                fontFamily: GoogleFonts.farro()
                                                    .fontFamily,fontWeight: FontWeight.bold,
                                                fontSize: 11),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Countup(
                                            begin: 0,
                                            end: 100,
                                            duration: Duration(seconds: 400),
                                            separator: '',
                                            style: TextStyle(
                                                fontSize: 36,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                    height: 100,
                                    width: 250,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.countertops,
                                          size: 60,
                                        ),
                                        SizedBox(
                                          width: 18,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              MyCubit.get(context).lasn == 'en'
                                                  ? '       Countries'
                                                  : ' بلدان ',
                                              style: TextStyle(
                                                  color: Colors.orange.shade900,
                                                  fontFamily:
                                                      GoogleFonts.farro()
                                                          .fontFamily,fontWeight: FontWeight.bold,
                                                  fontSize: 11),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Countup(
                                              begin: 0,
                                              end: 60,
                                              duration: Duration(seconds: 100),
                                              separator: '',
                                              style: TextStyle(
                                                  fontSize: 36,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  height: 100,
                                  width: 250,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.timeline_outlined,
                                          size: 60,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            MyCubit.get(context).lasn == 'en'
                                                ? 'Establishment Date'
                                                : ' تاريخ الإنشاء',
                                            style: TextStyle(
                                                color: Colors.orange.shade900,
                                                fontFamily: GoogleFonts.farro()
                                                    .fontFamily,fontWeight: FontWeight.bold,
                                                fontSize: 11),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Countup(
                                            begin: 0,
                                            end: 2024,
                                            duration: Duration(minutes: 1),
                                            separator: '',
                                            style: TextStyle(
                                                fontSize: 36,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('About our work',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily:
                                          GoogleFonts.akatab().fontFamily,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(width: 20),
                            Icon(
                              Icons.arrow_downward_outlined,
                              color: Colors.white,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    AnimatedContainer(
                      duration: Duration(seconds: 5), // فترة زمنية للتأثير
                      width: MediaQuery.of(context)
                          .size
                          .width, // عرض يأخذ حجم الشاشة بالكامل
                      height: MediaQuery.of(context)
                          .size
                          .height, // ارتفاع يأخذ حجم الشاشة بالكامل
                   decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black,Colors.orange,Colors.black,])),
                      child: Animate(
                          effects: [FlipEffect(duration: Duration(seconds: 2))],
                          child: Container(
                              alignment: Alignment.topCenter,
                              color: Colors.orange.withOpacity(0.1),
                              width: double.infinity,
                              height: 400,
                              child: SliderName3(context))),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    EdfDrowerForPhone(context)
                  ]),
            ),
          ),
        ),
      ),
    );

Widget pcLastNews(newsMobeVac, context, int index) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Newss(),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.9),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      height: 130, decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(5))),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  MyCubit.get(context).lasn == 'en'
                                      ? newsMobeVac['Title']
                                      : newsMobeVac['TitleA'],
                                  style: TextStyle(
                                      color: Colors.black,fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                ),
                              ),
                            ),Spacer(),
                            Expanded(
                              child: Icon(
                                Icons.newspaper_sharp,
                                size: 100,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    newsMobeVac['New'] == 'New'
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 90,
                              height: 49,
                              child: Text(newsMobeVac['New'],
                                  style: TextStyle(color: Colors.white)),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(0.7)),
                            ),
                          )
                        : Container(),
                    Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          MyCubit.get(context).lasn == 'en'
                              ? newsMobeVac['DesNew']
                              : newsMobeVac['DesNewA'],
                          style: TextStyle(fontSize: 16,
                              color: Colors.white38, fontWeight: FontWeight.w400),
                          maxLines: 2,
                        )),SizedBox(height: 40,),
                    Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          MyCubit.get(context).lasn == 'en'
                              ? newsMobeVac['Title']
                              : newsMobeVac['TitleA'],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
SizedBox(height: 20,),                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(newsMobeVac['Data'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17)),
                          Spacer(),
                          CircleAvatar(
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.orange,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

class HomeIn {
  var bottom;
  var toD;
  var ImagH;
  var w;
  var toPh;
  var Letphon;
  var h;
  var tp;
  var wdes;
  var right;
  var paR;
  var siz;
  var op;
  var col;
  Color co;
  var TitH;
  var TitHa;
  HomeIn(
      {this.toD,
      this.col,
      this.wdes,
      this.Letphon,
      this.toPh,
      required this.op,
      required this.tp,
      required this.h,
      required this.w,
      required this.right,
      required this.ImagH,
      required this.TitH,
      required this.TitHa,
      required this.paR,
      required this.bottom,
      required this.co,
      required this.siz});
}

List<HomeIn> HomeL = [
  HomeIn(
      paR: 100,
      siz: 70,
      right: 200,
      tp: 400,
      op: 50,
      Letphon: 100,
      toPh: 150,
      bottom: 100,
      w: 70,
      h: 60,
      col: Colors.indigo.shade200,
      wdes: 90,
      toD: 430,
      co: Colors.white,
      ImagH: 'images/ImageCompanyMove/img_7.png',
      TitH: 'MOBEVAC',
      TitHa: 'موبيفاك'),
  HomeIn(
      paR: 100,
      bottom: 40,
      co: Colors.white,
      right: 1500,
      tp: 100,
      op: 100,
      toD: 100,
      ImagH: 'images/ImageCompanyMove/img_8.png',
      siz: 50,
      w: 100,
      h: 60,
      Letphon: 200,
      toPh: 150,
      col: Colors.white30,
      TitH: 'The heart of the ideal vaccines',
      wdes: 100,
      TitHa: "قلب اللقاحات المثالية"),
  HomeIn(
      paR: 10,
      bottom: 40,
      co: Colors.black,
      col: Colors.white,
      ImagH: 'images/ImageCompanyMove/img_9.png',
      siz: 50,
      right: 100,
      tp: 300,
      op: 60,
      Letphon: 40,
      toPh: 150,
      TitH: 'The best vaccines in the world',
      w: 90,
      h: 50,
      wdes: 150,
      toD: 300,
      TitHa: 'فضل للقاحات في العالم '),
];
Widget Cara(ImgeCarsoulTowCont imageLstTowContwe, context) => Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Animate(
              effects: [FlipEffect(duration: Duration(seconds: 5))],
              child: Row(
                children: [
                  Expanded(
                    child: Animate(
                      effects: [FlipEffect(duration: Duration(seconds: 2))],
                      child: Container(
                        height: 600,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.black.withOpacity(0.6),
                            border: Border.all(
                              width: 6,
                              color: Colors.black.withOpacity(0.3),
                            )),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                  height: 700,
                                  color: Colors.black26,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(50.0),
                                        child: Text(
                                          MyCubit.get(context).lasn == 'en'
                                              ? imageLstTowContwe.Tex
                                              : imageLstTowContwe.TexA,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 70,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    imageLstTowContwe.Navegator,
                                              ));
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 250,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${imageLstTowContwe.TextCont}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(Icons.arrow_upward)
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      )
                                    ],
                                  )),
                            ),
                            Expanded(
                                child: Container(
                              height: 700,
                              alignment: Alignment.center,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 300,
                                    height: 90,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: imageLstTowContwe.Col,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      MyCubit.get(context).lasn == 'en'
                                          ? 'Who we are '
                                          : 'من نحن ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily:
                                              GoogleFonts.aladin().fontFamily),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: imageLstTowContwe.Col1,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    width: 250,
                                    height: 90,
                                    alignment: Alignment.center,
                                    child: Text(
                                      MyCubit.get(context).lasn == 'en'
                                          ? 'What we do '
                                          : 'ماذا نفعل',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily:
                                              GoogleFonts.aladin().fontFamily),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    width: 250,
                                    decoration: BoxDecoration(
                                        color: imageLstTowContwe.Col2,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    height: 90,
                                    alignment: Alignment.center,
                                    child: Text(
                                      MyCubit.get(context).lasn == 'en'
                                          ? 'News'
                                          : 'اخبار ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily:
                                              GoogleFonts.aladin().fontFamily),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            Expanded(
                              child: Container(
                                  height: 700,
                                  color: Colors.black26,
                                  child: Padding(
                                    padding: EdgeInsets.all(13),
                                    child: Image(
                                      image: AssetImage(imageLstTowContwe.Imag),
                                      width: 500,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
Widget PhomeCre(ImgeCarsoulTowCont imageLstTowContwe, context) => Column(
      children: [
        Expanded(
            child: Container(
                alignment: Alignment.center,
                height: 2000,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageLstTowContwe.Imag),
                        opacity: 0.8,
                        fit: BoxFit.cover)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.blue.shade50),
                      height: 190,
                      width: 390,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              MyCubit.get(context).lasn == 'en'
                                  ? imageLstTowContwe.Tex
                                  : imageLstTowContwe.TexA,
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          imageLstTowContwe.Navegator,
                                    ));
                              },
                              child: Container(
                                height: 60,
                                width: 170,
                                alignment: Alignment.center,
                                decoration:
                                    BoxDecoration(color: Colors.blue.shade50),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${imageLstTowContwe.TextCont}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.arrow_upward)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ))),
        SizedBox(
          width: 15,
        ),
      ],
    );

class ImgeCarsoulTowCont {
  var Col;
  var Col1;
  var Col2;
  var Imag;
  var Tex;
  var TextCont;
  var Navegator;
  var TexA;
  ImgeCarsoulTowCont(
      {required this.TexA,
      required this.Col,
      required this.Col1,
      required this.Col2,
      required this.Imag,
      required this.Tex,
      required this.TextCont,
      required this.Navegator});
}

List<ImgeCarsoulTowCont> ImageLstTowContwe = [
  ImgeCarsoulTowCont(
      Col: Colors.orange.shade300,
      Col1: Colors.white,
      Col2: Colors.white,
      TextCont: 'Explore   we are',
      Navegator: AboutUs(),
      TexA:
          'شمل مجموعة اللقاحات المتوفرة داء الكلب، وحمى السل، والفيروس الغدي (التهاب الكبد الكلابي المعدي)، والفيروس الصغير، وداء البريميات، ونظير الأنفلونزا، وفيروس كورونا، والبورديتيلا القصبية، ومرض لايم، وأنفلونزا الكلاب  للحصول على تفاصيل حول هذه الأمراض، راجع النشرات الفردية "داء الكلب  ',
      Imag: 'images/ImageCompanyMove/img_10.png',
      Tex:
          'he range of vaccines available includes rabies, distemper, adenovirus (infectious canine hepatitis), parvovirus, leptospirosis, parainfluenza, coronavirus, Bordetella bronchiseptica, Lyme disease, and canine influenza (for details on these diseases, see individual handouts “Rabies in '),
  ImgeCarsoulTowCont(
      Col1: Colors.orange.shade300,
      Col: Colors.white,
      Col2: Colors.white,
      TextCont: 'Explore what we do',
      Navegator: Product(),
      Imag: 'images/ImageCompanyMove/img_11.png',
      Tex:
          'The AAFP vaccination guidelines recommend that low-risk adult cats be vaccinated every three years with the core vaccines, and then as determined by your veterinarian for any non-core vaccines. Some vaccine manufacturers have developed approved three-year doses for many of the core vaccines.',
      TexA:
          'توصي إرشادات التطعيم AAFP بتطعيم القطط البالغة منخفضة الخطورة كل ثلاث سنوات باللقاحات الأساسية، ثم على النحو الذي يحدده الطبيب البيطري لأي لقاحات غير أساسية. قامت بعض الشركات المصنعة للقاحات بتطوير جرعات معتمدة لمدة ثلاث سنوات للعديد من اللقاحات الأساسية.'),
  ImgeCarsoulTowCont(
      Col2: Colors.orange.shade300,
      Col: Colors.white,
      Col1: Colors.white,
      TextCont: 'Explore News',
      Navegator: Newss(),
      Imag: 'images/ImageCompanyMove/img_12.png',
      TexA:
          'لا يمكن التقليل من أهمية التطعيمات للصحة العامة وطول عمر قطتك. لقد أثبتت لقاحات القطط طبيًا وعلميًا فعاليتها في مكافحة حضانة ونقل أمراض القطط المعوقة والمميتة. طاقمنا البيطري مكرس لتثقيف آباء الحيوانات الأليفة حول أهمية تطعيمات القطط، بما في ذلك لقاحات القطط الضرورية ومتى يجب تحديد موعد لها.',
      Tex:
          'The importance of vaccinations to the overall health and longevity of your cat cannot be understated. Cat vaccines are medically and scientifically proven to combat the incubation and transmission of crippling and fatal feline diseases. Our veterinary staff is dedicated to educating pet parents about the importance of cat vaccinations, including what cat vaccines are necessary, and when they should be scheduled.'),
];
