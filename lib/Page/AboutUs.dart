import 'dart:async';
import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';

import '../MyBloc/Cubit.dart';
import '../MyBloc/Stat.dart';
import 'HomeDesine.dart';
import 'News.dart';
import 'FireBaseCodes.dart';
import 'FireBaseCodes.dart';
import 'HomeInformationpage.dart';
import 'Product.dart';

class AboutUs extends StatefulWidget {
  @override
  State<AboutUs> createState() => _AboutUsState();
}

bool _loading1 = false;

class _AboutUsState extends State<AboutUs> {
  @override
  Future SHO() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
  }

  void _startLoading() {
    setState(() {
      _loading1 = true;
    });

    Timer(Duration(seconds: 8), () {
      setState(() {
        _loading1 = false;
      });
    });
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, MyStat>(
      builder: (context, state) => Animate(
        effects: [
          ThenEffect(duration: Duration(seconds: 1)),

        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 768) {
              return DisMobile(context);
            } else {
              return DisPlayDeskTop(context);
            }
          },
        ),
      ),
      listener: (context, state) {},
    );
  }
}

var activP = 0;
var pageController = PageController();
var carouselController = CarouselController();

Widget DisPlayDeskTop(context) => Scaffold(
      backgroundColor: Colors.black,
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
                  focusColor: Colors.orange.shade800,
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
                                  builder: (context) => HomeInformationpage(),
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
                            thumbVisibility: MaterialStateProperty.all(true),
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
                                  borderRadius: BorderRadius.circular(0.2)),
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
                            thumbVisibility: MaterialStateProperty.all(true),
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
      drawer:
          MediaQuery.of(context).size.width < 911 ? ReUserDro(context) : null,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[];
        },
        body: _loading1
            ? CircularProgressIndicator()
            : ConditionalBuilder(
                builder: (context) => SingleChildScrollView(
                        child: Container(
                      color: Colors.black,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 300,alignment: Alignment.center,
                                width: double.infinity,
                                color: Colors.black,
                                child: Row( crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                 Expanded   (
                                      child: Padding(
                                        padding: const EdgeInsets.all(30.0),
                                        child: Text(
                                            'The Arab Pesticides and Veterinary Drugs ',
                                            style: TextStyle(
                                              fontFamily:
                                                  GoogleFonts.hindMadurai()
                                                      .fontFamily,
                                              color: Colors.white,
                                              fontSize: 40,
                                            )),
                                      ),
                                    ),

                                 Container(
                                    color: Colors.orange.shade800,
                                    height: 90,
                                    width: 7,
                                  ), 

                                  Expanded(child:   Padding(
                                    padding: const EdgeInsets.all(19.0),
                                    child: Text('MOBEVAC',
                                        style: TextStyle(
                                          fontFamily: GoogleFonts.hindMadurai()
                                              .fontFamily,
                                          color: Colors.white,
                                          fontSize: 40.0,
                                        )),
                                  ),)
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.orange.shade600,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(0.8),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CachedNetworkImage(
                                              imageUrl:
                                              "https://t3.ftcdn.net/jpg/06/08/82/50/360_F_608825085_MuQopoWCJQJ8BUa4u2z1DECXtkuoVLmj.jpg",
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                              height: 600,
                                              imageBuilder: (context,
                                                  imageProvider) =>
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        alignment: Alignment.center,
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                              placeholder: (context, url) => Center(
                                                  child:
                                                  CircularProgressIndicator(
                                                    strokeWidth: 9,
                                                    color: Colors.black,
                                                    backgroundColor: Colors.indigo,
                                                  )),
                                              // placeholder: (context, url) => CircularProgressIndicator(),
                                              errorWidget: (context, url, error) =>
                                                  Center(
                                                      child:
                                                      CircularProgressIndicator(
                                                        strokeWidth: 9,
                                                        color: Colors.black,
                                                        backgroundColor: Colors.indigo,
                                                      ))),
                                        ),
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            width: 300,
                                            height: 150,
                                            color: Colors.black.withOpacity(0.4),
                                            child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.all(16.0),
                                                    child: Text('ABOUT US',
                                                        style: TextStyle(
                                                            fontSize: 40,
                                                            color: Colors
                                                                .orange.shade600)),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.all(7.0),
                                                    child: Text('MobeVace',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors
                                                                .orange.shade600)),
                                                  )
                                                ])),
                                      ],
                                    ),
                                  )),
                            ),
                            SizedBox(height:  30),


                            Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Container(
                                    width: double.infinity,
                                    height: 600,
                                    decoration: BoxDecoration(
                                      color: Colors.orange.shade600,
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 40,), Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            MyCubit.get(context).lasn == 'en'
                                                ? 'Who we are?'
                                                : 'من نحن',
                                            style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    GoogleFonts.arbutusSlab()
                                                        .fontFamily,
                                                color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 110,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                height: 3,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: GoogleFonts.khula()
                                                    .fontFamily,
                                              ),
                                              MyCubit.get(context).lasn == 'en'
                                                  ? 'The Arab Pesticides and Veterinary Drugs Mfg.Co (Mobedco) is a public share-holding generic manufacturer of veterinary drugs and pesticides established in 1991 in  Jordan We started as an agricultural pesticides manufacturer, then our production range was expanded to include a wide variety of veterinary medications to improve the health of farm and companion animals. Ever since, Mobedco grew to become a high capacity company with up to 200 registered products with different dosage forms. Mobedco excellence is recognized by ISO certifying bodies.  We obtained ISO 9001 certifications for quality management system and ISO 14001  for environmental management system. We, at Mobedco, are also known for our “GMP culture”; the result of our total quality approach.'
                                                  : 'الشركة العربية لصناعة المبيدات والأدوية البيطرية (مبيدكو) هي إحدى أهم الشركات الرائدة في مجال صناعة الأدوية البيطرية والمبيدات الزراعية ، تأسست في الأردن عام 1991. كان نشاط الشركة يقتصر في البداية على تصنيع المبيدات الزراعية، ثم توسعت القاعدة الإنتاجية لتشمل تصنيع الأدوية البيطرية بأشكالها المختلفة، استمرت الشركة بالنمو ليصبح لديها أكثر من 200 صنف مسجّل.حصلت مبيدكو على شهادة إدارة الجودة ISO 9001 وشهادة إدارة البيئة ISO 14001، كما ونعرف في مبيدكو بثقافة التصنيع الدوائي الجيد الناتجة عن إلتزامنا بتحقيق مفهوم إدارة الجودة الشاملة.'),
                                        ),
                                      ],
                                    ))),

                            SizedBox(height: 200),
                            Center(
                              child: Container(
                           decoration: BoxDecoration(border: Border.all(      color: Colors.orange.shade500,width:4)),
                                alignment: Alignment.center,
                                width: 1500,
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height:40,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text(
                                            MyCubit.get(context).lasn == 'en'
                                                ? 'why you choose our company?'
                                                : 'لماذا تختارنا ؟',
                                            style: TextStyle(
                                                fontSize: 43,
                                                color: Colors.white,
                                                fontFamily:
                                                    GoogleFonts.akayaKanadaka()
                                                        .fontFamily,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      SizedBox(
                                        height: 90,
                                      ),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .add_shopping_cart_rounded,
                                                      color: Colors.orange.shade700,
                                                      size: 50,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                        MyCubit.get(context)
                                                                    .lasn ==
                                                                'en'
                                                            ? 'Experts in the Market'
                                                            : 'خبراء في السوق',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                GoogleFonts
                                                                        .aleo()
                                                                    .fontFamily,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                              child: Container(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                        Icons
                                                            .design_services_outlined,
                                                        size: 50,
                                                      color: Colors.orange.shade700,),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                        MyCubit.get(context)
                                                                    .lasn ==
                                                                'en'
                                                            ? 'Excellent Service'
                                                            : 'خدمة عملاء ممتازه',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                GoogleFonts
                                                                        .aleo()
                                                                    .fontFamily,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .new_releases_rounded,
                                                      size: 50,
                                                        color: Colors.orange.shade700
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                        MyCubit.get(context)
                                                                    .lasn ==
                                                                'en'
                                                            ? 'Certified'
                                                            : 'معتمدة عالمياً',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                GoogleFonts
                                                                        .aleo()
                                                                    .fontFamily,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .receipt_long_outlined,
                                                      size: 50,
                                                      color: Colors.orange.shade700,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                        MyCubit.get(context)
                                                                    .lasn ==
                                                                'en'
                                                            ? 'Quality and Reliability'
                                                            : 'جودة وثقة',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                GoogleFonts
                                                                        .aleo()
                                                                    .fontFamily,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]),     SizedBox(
                                        height:40,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 200),

                            Padding(
                              padding: const EdgeInsets.all(23.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.2)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 600,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  MyCubit.get(context).lasn ==
                                                          'en'
                                                      ? 'We are commited to delivering quality first since 1991.'
                                                      : 'تأسست في الأردن عام 1991.',
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          GoogleFonts.farro()
                                                              .fontFamily)),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                  MyCubit.get(context).lasn ==
                                                          'en'
                                                      ? 'Our Global Presence'
                                                      : '                                             حضورنا العالمي',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          GoogleFonts.farro()
                                                              .fontFamily)),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                  MyCubit.get(context).lasn ==
                                                          'en'
                                                      ? 'Mobedco is currently exporting to around 40 countries worldwide. We cover areas from Asia to Africa and Common Wealth of Independent States (CIS). We are also attempting to enter the European markets as a significantly forward step for our company’s future'
                                                      : 'تصدر مبيدكو حالياً منتجاتها إلى حوالي 40 دولة حول العالم، تشمل آسيا وإفريقيا ورابطة الدول المستقلة (الكمنولث) وتسعى أيضاً لدخول الأسواق الأوروبية كخطوة قوية إلى الأمام.',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.farro()
                                                              .fontFamily)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(color: Colors.transparent.withOpacity(0.1),
                                        child: Image(
                                            image: AssetImage(
                                                'images/ImageCompanyMove/img_13.png'), ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(50.0),
                                child: Text(
                                  MyCubit.get(context).lasn == 'en'
                                      ? 'Our History'
                                      : 'تاريخنا',
                                  style: TextStyle(
                                      fontSize: 60,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.farro().fontFamily),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  MyCubit.get(context).lasn == 'en'
                                      ? 'MobeVac'
                                      : 'MobeVac',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange.shade900,
                                      fontFamily:
                                          GoogleFonts.abel().fontFamily),
                                ),
                              ),
                            ),
                            Center(
                                child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              height: 10,
                              color: Colors.orangeAccent.shade400,
                            )),
                            SizedBox(
                              height: 30,
                            ),
                            Timeline.tileBuilder(
                                padding: EdgeInsets.all(40),
                                physics: ScrollPhysics(),
                                semanticChildCount: 1,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shrinkWrap: true,
                                theme: TimelineThemeData(
                                    color: Colors.white,
                                    connectorTheme: ConnectorThemeData(
                                      color: Colors.yellow,
                                    )),
                                builder: TimelineTileBuilder.fromStyle(
                                  contentsAlign: ContentsAlign.alternating,
                                  connectorStyle: ConnectorStyle.dashedLine,
                                  oppositeContentsBuilder: (context, index) =>
                                      Cl(context, HesL[index]),
                                  itemCount: HesL.length,
                                )),
                            SizedBox(
                              height: 150,
                            ),
                            Center(
                                child: Container(
                              width: 900,
                              height: 800,
                              decoration:
                                  BoxDecoration(color: Colors.orange.shade600),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Image.asset(
                                              'images/ImageCompanyMove/img_4.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Expanded(
                                              child: Container(
                                            child: Image.asset(
                                              'images/ImageCompanyMove/img_2.png',
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Image.asset(
                                              'images/ImageCompanyMove/img_6.png',
                                            ),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Expanded(
                                              child: Image.asset(
                                            'images/ImageCompanyMove/img_3.png',
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                            SizedBox(
                              height: 80,
                            ),

                            EndDrowerForComputer(context) //
                          ]),
                    )),
                fallback: (context) => Center(
                      child: CircularProgressIndicator(),
                    ),
                condition: true),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        width: double.infinity,
        height: 30,
      ),
    );

Widget DisMobile(context) => Scaffold(
      backgroundColor: Colors.black,
      appBar: ReUseAppBarPhone(context, Col: Colors.orange.shade500),
      drawer: ReUserDro(context),
      body: ConditionalBuilder(
          builder: (context) => SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 300,alignment: Alignment.center,
                              width: double.infinity,
                              color: Colors.black,
                              child: Row( crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded   (
                                    child: Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: Text(
                                          'The Arab Pesticides and Veterinary Drugs ',
                                          style: TextStyle(
                                            fontFamily:
                                            GoogleFonts.hindMadurai()
                                                .fontFamily,
                                            color: Colors.white,
                                            fontSize: 40,
                                          )),
                                    ),
                                  ),

                                  Container(
                                    color: Colors.orange.shade800,
                                    height: 90,
                                    width: 7,
                                  ),

                                  Expanded(child:   Padding(
                                    padding: const EdgeInsets.all(19.0),
                                    child: Text('MOBEVAC',
                                        style: TextStyle(
                                          fontFamily: GoogleFonts.hindMadurai()
                                              .fontFamily,
                                          color: Colors.white,
                                          fontSize: 40.0,
                                        )),
                                  ),)
                                ],
                              )),
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.orange.shade600,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(0.8),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "https://t3.ftcdn.net/jpg/06/08/82/50/360_F_608825085_MuQopoWCJQJ8BUa4u2z1DECXtkuoVLmj.jpg",
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          height: 300,
                                          imageBuilder: (context,
                                                  imageProvider) =>
                                              Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    alignment: Alignment.center,
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                          placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                strokeWidth: 9,
                                                color: Colors.black,
                                                backgroundColor: Colors.indigo,
                                              )),
                                          // placeholder: (context, url) => CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                strokeWidth: 9,
                                                color: Colors.black,
                                                backgroundColor: Colors.indigo,
                                              ))),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        width: 300,
                                        height: 150,
                                        color: Colors.black.withOpacity(0.4),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Text('ABOUT US',
                                                    style: TextStyle(
                                                        fontSize: 40,
                                                        color: Colors
                                                            .orange.shade600)),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(7.0),
                                                child: Text('MobeVace',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors
                                                            .orange.shade600)),
                                              )
                                            ])),
                                  ],
                                ),
                              )),

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              MyCubit.get(context).lasn == 'en'
                                  ? 'Who we are'
                                  : 'من نحن',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      GoogleFonts.arbutusSlab().fontFamily,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                  width: 900,
                                  height: 500,
                                  decoration: BoxDecoration(
                                    color: Colors.orange.shade600,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Text(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          height: 3,
                                          fontWeight: FontWeight.w700,
                                          fontFamily:
                                              GoogleFonts.khula().fontFamily,
                                        ),
                                        MyCubit.get(context).lasn == 'en'
                                            ? 'The Arab Pesticides and Veterinary Drugs Mfg.Co (Mobedco) is a public share-holding generic manufacturer of veterinary drugs and pesticides established in 1991 in  Jordan We started as an agricultural pesticides manufacturer, then our production range was expanded to include a wide variety of veterinary medications to improve the health of farm and companion animals. Ever since, Mobedco grew to become a high capacity company with up to 200 registered products with different dosage forms. Mobedco excellence is recognized by ISO certifying bodies.  We obtained ISO 9001 certifications for quality management system and ISO 14001  for environmental management system. We, at Mobedco, are also known for our “GMP culture”; the result of our total quality approach.'
                                            : 'الشركة العربية لصناعة المبيدات والأدوية البيطرية (مبيدكو) هي إحدى أهم الشركات الرائدة في مجال صناعة الأدوية البيطرية والمبيدات الزراعية ، تأسست في الأردن عام 1991. كان نشاط الشركة يقتصر في البداية على تصنيع المبيدات الزراعية، ثم توسعت القاعدة الإنتاجية لتشمل تصنيع الأدوية البيطرية بأشكالها المختلفة، استمرت الشركة بالنمو ليصبح لديها أكثر من 200 صنف مسجّل.حصلت مبيدكو على شهادة إدارة الجودة ISO 9001 وشهادة إدارة البيئة ISO 14001، كما ونعرف في مبيدكو بثقافة التصنيع الدوائي الجيد الناتجة عن إلتزامنا بتحقيق مفهوم إدارة الجودة الشاملة.'),
                                  ))),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Container(
                                                    decoration: BoxDecoration(  color: Colors.black, border:Border.all(color: Colors.orange.shade600,width: 6)),
                                alignment: Alignment.center,
                                width: 900,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [  SizedBox(
                                      height: 40,
                                    ),
                                      Text(
                                          MyCubit.get(context).lasn == 'en'
                                              ? 'why you choose our company?'
                                              : 'لماذا تختارنا ؟',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.orange.shade100,
                                              fontFamily:
                                                  GoogleFonts.akayaKanadaka()
                                                      .fontFamily,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 90,
                                      ),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .add_shopping_cart_rounded,
                                                      color: Colors.white,
                                                      size: 17,
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        MyCubit.get(context)
                                                                    .lasn ==
                                                                'en'
                                                            ? 'Experts in the Market'
                                                            : 'خبراء في السوق',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 9,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                GoogleFonts.aleo()
                                                                    .fontFamily,
                                                            fontWeight:
                                                                FontWeight.bold))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                              child: Container(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                        Icons
                                                            .design_services_outlined,
                                                        size: 17,
                                                        color: Colors.white),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        MyCubit.get(context)
                                                                    .lasn ==
                                                                'en'
                                                            ? 'Excellent Service'
                                                            : 'خدمة عملاء ممتازه',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 9,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                GoogleFonts.aleo()
                                                                    .fontFamily,
                                                            fontWeight:
                                                                FontWeight.bold))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.new_releases_rounded,
                                                      size: 17,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        MyCubit.get(context)
                                                                    .lasn ==
                                                                'en'
                                                            ? 'Certified'
                                                            : 'معتمدة عالمياً',
                                                        style: TextStyle(
                                                            fontSize: 9,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                GoogleFonts.aleo()
                                                                    .fontFamily,
                                                            fontWeight:
                                                                FontWeight.bold))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.receipt_long_outlined,
                                                      size: 17,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        MyCubit.get(context)
                                                                    .lasn ==
                                                                'en'
                                                            ? 'Quality and Reliability'
                                                            : 'جودة وثقة',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 9,
                                                            fontFamily:
                                                                GoogleFonts.aleo()
                                                                    .fontFamily,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]),  SizedBox(
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 90,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              color: Colors.orange,
                              height: 200,
                              alignment: Alignment.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 9,
                                            ),
                                            Text(
                                                MyCubit.get(context).lasn ==
                                                        'en'
                                                    ? 'We are commited to delivering quality first since 1991.'
                                                    : 'تأسست في الأردن عام 1991.',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontFamily:
                                                        GoogleFonts.farro()
                                                            .fontFamily)),
                                            SizedBox(
                                              height: 9,
                                            ),
                                            Text(
                                                MyCubit.get(context).lasn ==
                                                        'en'
                                                    ? 'Our Global Presence'
                                                    : 'حضورنا العالمي',
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        GoogleFonts.farro()
                                                            .fontFamily)),
                                            SizedBox(
                                              height: 9,
                                            ),
                                            Text(
                                                MyCubit.get(context).lasn ==
                                                        'en'
                                                    ? 'Mobedco is currently exporting to around 40 countries worldwide. We cover areas from Asia to Africa and Common Wealth of Independent States (CIS). We are also attempting to enter the European markets as a significantly forward step for our company’s future'
                                                    : 'تصدر مبيدكو حالياً منتجاتها إلى حوالي 40 دولة حول العالم، تشمل آسيا وإفريقيا ورابطة الدول المستقلة (الكمنولث) وتسعى أيضاً لدخول الأسواق الأوروبية كخطوة قوية إلى الأمام.',
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontFamily:
                                                        GoogleFonts.farro()
                                                            .fontFamily)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 120,
                                      child: Image(
                                          filterQuality: FilterQuality.low,
                                          colorBlendMode: BlendMode.colorBurn,
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'images/ImageCompanyMove/img_13.png')),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              MyCubit.get(context).lasn == 'en'
                                  ? 'Our History'
                                  : 'تاريخنا',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: GoogleFonts.aladin().fontFamily),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              MyCubit.get(context).lasn == 'en'
                                  ? 'MobeVac'
                                  : 'MobeVac',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange.shade900,
                                  fontFamily: GoogleFonts.abel().fontFamily),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 10,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Timeline.tileBuilder(
                              padding: EdgeInsets.all(40),
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              theme: TimelineThemeData(
                                  color: Colors.white,
                                  connectorTheme: ConnectorThemeData(
                                    color: Colors.orange.shade100,
                                  )),
                              builder: TimelineTileBuilder.fromStyle(
                                contentsAlign: ContentsAlign.alternating,
                                connectorStyle: ConnectorStyle.dashedLine,
                                oppositeContentsBuilder: (context, index) =>
                                    Cl(context, HesL[index]),
                                itemCount: HesL.length,
                              )),

                          Center(
                              child: Container(
                            width: 900,
                            height: 500,
                            color: Colors.orange.shade700,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            'images/ImageCompanyMove/img_4.png',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                            child: Container(
                                          child: Image.asset(
                                            'images/ImageCompanyMove/img_2.png',
                                          ),
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            'images/ImageCompanyMove/img_6.png',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                            child: Image.asset(
                                          'images/ImageCompanyMove/img_3.png',
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: MyCubit.get(context).lasn == 'en'
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: Text(
                                                  'M',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                child: Text(
                                                  'O',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                child: Text(
                                                  'B',
                                                  style: TextStyle(
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      fontSize: 40,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                child: Text(
                                                  'E',
                                                  style: TextStyle(
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      fontSize: 40,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                child: Text(
                                                  'V',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                child: Text(
                                                  'A',
                                                  style: TextStyle(
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      fontSize: 40,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                child: Text(
                                                  'C',
                                                  style: TextStyle(
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      fontSize: 40,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                child: Text(
                                                  'E',
                                                  style: TextStyle(
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      fontSize: 40,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: Text(
                                                  'E',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 25),
                                              Expanded(
                                                child: Text(
                                                  'C',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                child: Text(
                                                  'A',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                child: Text(
                                                  'V',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                child: Text(
                                                  'E',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                child: Text(
                                                  'B',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                child: Text(
                                                  'O',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                child: Text(
                                                  'M',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      fontFamily: GoogleFonts
                                                              .dancingScript()
                                                          .fontFamily,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                            ],
                                          ),
                                  ),
                                ],
                              ),
                              height: 150,
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),

                          EdfDrowerForPhone(context) //
                        ]),
                    width: double.infinity,
                    decoration: BoxDecoration()),
              )),
          fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
          condition: true),
      bottomNavigationBar: Container(
        color: Colors.black,
        width: double.infinity,
        height: 15,
      ),
    );

class Hes {
  var Ar;
  var En;
  var dat;
  Hes({
    this.Ar,
    this.En,
    this.dat,
  });
}

List<Hes> HesL = [
  Hes(
      Ar: 'تأسيس الشركة كشركة ذات مسؤولية محدودة (ذ م م) برأس مال 300,000 دينار أردني.',
      En: 'Establishment of the company as a Limited Liability Company (LLC) with a capital of 300,000 JOD',
      dat: '1991'),
  Hes(
      dat: '1993',
      Ar: 'بداية الإنتاج في مصنع المبيدات الزراعية.',
      En: 'Agrochemicals production commenced'),
  Hes(
      dat: '1996    ',
      Ar: 'بداية الإنتاج في مصنع الأدوية البيطرية (مساحيق وسوائل ) ورفع رأس مال الشركة إلى مليون و400,000 دينار أردني.',
      En: 'Oral veterinary production plant was launched with an increased capital to 1.4 million JOD'),
  Hes(
      dat: '1998    ',
      Ar: 'الحصول على شهادة ISO 9001، وإضافة خط تصنيع السوائل المعلقة إلى مصنع المبيدات الزراعية.',
      En: 'Obtained ISO 9001 along with an addition of suspension agrochemical production line. '),
  Hes(
      dat: '2000    ',
      Ar: 'الحصول على شهادة ISO 14001، وإضافة خط تصنيع الحقن العام إلى المصنع البيطري.',
      En: 'Obtained ISO 14001 along with an addition of general veterinary injectable line.'),
  Hes(
      dat: '2004    ',
      En: 'Establishment  of Aspeco factory in Syria with an increased capital to 6 million JOD.',
      Ar: 'تأسيس مصنع أسبيكو (Aspeco) بسوريا، ورفع رأس مال مبيدكو إلى 6 مليون دينار أردني'),
  Hes(
      dat: '2005    ',
      En: 'Addition of two penicillin lines- injectable and powder- to the companys veterinary division.  ',
      Ar: 'إضافة خطي البنسلينيات الحقن والبودرة إلى المصنع البيطري.'),
  // Hes(dat:'' ,En: '',Ar: ''), Hes(dat:'' ,En: '',Ar: ''),
  //  Hes(dat:'' ,En: '',Ar: ''),
  //  Hes(dat:'' ,En: '',Ar: '')
];
Widget Cl(context, Hes hesL) => Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: hesL.dat,
            style: TextStyle(fontSize: 18, color: Colors.white),
            children: <TextSpan>[],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              MyCubit.get(context).lasn == 'en' ? '${hesL.En}' : '${hesL.Ar}',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.orange.shade700,
                  fontFamily: GoogleFonts.alata().fontFamily)),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
