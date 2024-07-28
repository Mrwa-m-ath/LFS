import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../MyBloc/Cubit.dart';
import 'AboutUs.dart';
import 'News.dart';
import 'HomeInformationpage.dart';
import 'Product.dart';

List ProductionList = [];
CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('MobeVace');
List ProductionListAr = [];
CollectionReference collectionReferenceAr =
    FirebaseFirestore.instance.collection('MobeveceAr');

List AboutListAr = [];

CollectionReference AboutUsColle =
    FirebaseFirestore.instance.collection('AboutUsEng');
List NewsMobeVac = [];
CollectionReference AcollectionNews =
    FirebaseFirestore.instance.collection('News');

ReUserDro(context) => Container(
      alignment: AlignmentDirectional.topCenter,
      decoration: BoxDecoration(color: Colors.transparent.withOpacity(0.3)),
      width: 400,
      height: 1200,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(alignment: Alignment.topLeft,
          color: Colors.white,
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 23,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black26, width: 0.9)),
                          child: Text('X'),
                        ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => HomeInformationpage());
                    },
                    child: MyCubit.get(context).lasn == 'en'
                        ? Text('Mobevac .',
                            style: TextStyle(
                                color: Colors.indigo.shade900,
                                fontSize: 20,
                                textBaseline: TextBaseline.ideographic,
                                fontWeight: FontWeight.bold))
                        : Text('مـبيفاك.',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: GoogleFonts.aleo().fontFamily,
                                color: Colors.indigo.shade900,
                                fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context, builder: (context) => AboutUs());
                  },
                  child: Row(
                    children: [
                      Text(
                          MyCubit.get(context).lasn == 'en'
                              ? 'Who we are'
                              : 'من نحن',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: GoogleFonts.aleo().fontFamily,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                        size: 19,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButton2(
                  underline: Text(''),

                  iconStyleData: IconStyleData(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    iconEnabledColor: Colors.black,
                    iconSize: 19,
                  ),
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
                    ),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: Radius.circular(40),
                      thickness: MaterialStateProperty.all(6),
                      thumbVisibility: MaterialStateProperty.all(true),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      child: TextButton(
                          child: Text(
                              MyCubit.get(context).lasn == 'en'
                                  ? 'Animal Health'
                                  : 'صحة الحيوان',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: GoogleFonts.aleo().fontFamily,
                                  color: Colors.indigo.shade300,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => Product(),
                            );
                          }),
                      enabled: false,
                    ),
                    DropdownMenuItem(
                      child: TextButton(
                          child: Text(
                              MyCubit.get(context).lasn == 'en'
                                  ? 'Pesticides'
                                  : 'مبيدات حشرية',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: GoogleFonts.aleo().fontFamily,
                                  color: Colors.indigo.shade300,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {}),
                      enabled: false,
                    ),
                  ],
                  isDense: true,

                  onChanged: (s) {},
                  hint: Text(
                    MyCubit.get(context).lasn == 'en'
                        ? 'What we do'
                        : 'الذي نفعله ',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.aleo().fontFamily,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    // style: TextStyle(
                    //     decoration: TextDecoration.none,
                    //     color: Colors.black,
                    //     fontSize: 10,
                    //     fontWeight: FontWeight.w600),
                  ),
                  // style: TextStyle(
                  //     decoration: TextDecoration.none,
                  //     color: Colors.black,
                  //     fontSize: 10,
                  //     fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      showDialog(
                          context: context, builder: (context) => Newss());
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          children: [
                            Text(
                                MyCubit.get(context).lasn == 'en'
                                    ? 'News'
                                    : 'أخبار',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: GoogleFonts.aleo().fontFamily,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black,
                              size: 19,
                            )
                          ],
                        ))),
                SizedBox(
                  height: 20,
                ),
                DropdownButton2(
                  underline: Text(''),
                  alignment: Alignment.center,
                  iconStyleData: IconStyleData(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    iconEnabledColor: Colors.black,
                    iconSize: 19,
                  ),
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
                    ),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: Radius.circular(40),
                      thickness: MaterialStateProperty.all(6),
                      thumbVisibility: MaterialStateProperty.all(true),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      child: TextButton(
                          child: Text('En',
                              style: Theme.of(context).textTheme.displaySmall),
                          onPressed: () {
                            AnimationController? controller;
                            MyCubit.get(context).ChangLanguageToEnglish();
                          }),
                      enabled: false,
                    ),
                    DropdownMenuItem(
                      child: TextButton(
                          child: Text('ar',
                              style: Theme.of(context).textTheme.displaySmall),
                          onPressed: () {
                            MyCubit.get(context)
                                .ChangeLanguageToArabic(context);
                          }),
                      enabled: false,
                    )
                  ],
                  isDense: true,

                  onChanged: (s) {},
                  hint: Text(
                    MyCubit.get(context).lasn == 'en'
                        ? 'Change Lan     '
                        : 'تغيير اللغه      ',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.aleo().fontFamily,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  // style: TextStyle(
                  //     decoration: TextDecoration.none,
                  //     color: Colors.black,
                  //     fontSize: 10,
                  //     fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.black26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Icon((Icons.location_on)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        MyCubit.get(context).lasn == 'en'
                                            ? 'Country sites'
                                            : 'موقعنا ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                        ))
                                  ],
                                ),
                              )),
                        ),
                        onTap: () {
                          MapsLauncher.launchQuery('مصنع مبيدكو');
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: InkWell(
                            child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black45)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon((Icons.phone)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          MyCubit.get(context).lasn == 'en'
                                              ? 'Contact Us'
                                              : 'تواصل معنا',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                          )),
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
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

EdfDrowerForPhone(context) => Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            MyCubit.get(context).lasn == 'en'
                ? Text(
                    'We are continuously looking for Distributors in:',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  )
                : Text('نحن نبحث باستمرار عن موزعين في:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                        fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            MyCubit.get(context).lasn == 'en'
                ? Text(
                    'Africa, Middle East, South East Asia, Latin America,Europe',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                        fontWeight: FontWeight.w500))
                : Text(
                    'أفريقيا والشرق الأوسط وجنوب شرق آسيا وأمريكا اللاتينية وأوروبا',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
            SizedBox(height: 15),
            MyCubit.get(context).lasn == 'en'
                ? Text('REGISTER YOUR INTEREST HERE...',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                        fontWeight: FontWeight.w500))
                : Text(
                    'سجل اهتمامك هنا ...',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
            SizedBox(height: 15),
            Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(color: Colors.orange),
                child: MaterialButton(
                  onPressed: () async {
                    final call = Uri.parse('tel:+91 9830268966');
                    if (await canLaunchUrl(call)) {
                      launchUrl(call);
                    } else {
                      throw 'Could not launch $call';
                    }
                  },
                  child: MyCubit.get(context).lasn == 'en'
                      ? Text('CONTACT US',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.lora().fontFamily,
                              fontSize: 12,
                              fontWeight: FontWeight.w500))
                      : Text('تواصل معنا ',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.lora().fontFamily,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                )),
            SizedBox(height: 35),
            Container(
              width: 300,
              height: 5,
              color: Colors.white,
            ),
            SizedBox(height: 35),
            Text(MyCubit.get(context).lasn == 'en' ? 'Follow us on' : 'تابعنا ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 35),
            Center(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        const url =
                            "https://www.facebook.com/marwa.mostafaa.96/?locale=ar_AR";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.orange.shade700,
                                  width: 2),
                              borderRadius: BorderRadius.circular(30)),
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white12,
                              child: Icon(
                                Icons.facebook,
                                size: 40,
                                color: Colors.orange.shade700,
                              )),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        const url = "https://www.linkedin.com/?";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.orange.shade700,
                                  width: 2),
                              borderRadius: BorderRadius.circular(30)),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white12,
                            child: Icon(
                              FontAwesomeIcons.linkedin,
                              color: Colors.orange.shade700,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        var whatsapp = "0096775430593";
                        var whatsappAndroid = Uri.parse(
                            "whatsapp://send?phone=$whatsapp&text=hello");
                        if (await canLaunchUrl(whatsappAndroid)) {
                          await launchUrl(whatsappAndroid);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "WhatsApp is not installed on the device"),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.orange.shade700,
                                  width: 2),
                              borderRadius: BorderRadius.circular(30)),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white12,
                            child: Icon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.orange.shade700,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
      width: double.infinity,
      height: 600,
      decoration: BoxDecoration(color: Colors.black),
    );

EndDrowerForComputer(context) => Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          MyCubit.get(context).lasn == 'en'
              ? Text(
                  'We are continuously looking for Distributors in:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                      fontWeight: FontWeight.bold),
                )
              : Text('نحن نبحث باستمرار عن موزعين في:',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                      fontSize: 19,
                      fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(
              MyCubit.get(context).lasn == 'en'
                  ? 'Africa, Middle East, South East Asia, Latin America,Europe'
                  : 'أفريقيا والشرق الأوسط وجنوب شرق آسيا وأمريكا اللاتينية وأوروبا',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 20),
          Text(
              MyCubit.get(context).lasn == 'en'
                  ? 'REGISTER YOUR INTEREST HERE...'
                  : 'سجل اهتمامك هنا ...',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 35),
          Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(color: Colors.orange),
              child: MaterialButton(
                  onPressed: () async {
                    final call = Uri.parse('tel:+91 9830268966');
                    if (await canLaunchUrl(call)) {
                      launchUrl(call);
                    } else {
                      throw 'Could not launch $call';
                    }
                  },
                  child: Text(
                      MyCubit.get(context).lasn == 'en'
                          ? 'CONTACT US'
                          : 'تواصل معنا ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.lora().fontFamily,
                          fontSize: 17,
                          fontWeight: FontWeight.w500)))),
          SizedBox(height: 35),
          Container(
            width: 300,
            height: 5,
            color: Colors.white,
          ),
          SizedBox(height: 35),
          Text(MyCubit.get(context).lasn == 'en' ? 'Follow us on' : 'تابعنا ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 35),
          Center(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      const url =
                          "https://www.facebook.com/marwa.mostafaa.96/?locale=ar_AR";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.orange, width: 2),
                            borderRadius: BorderRadius.circular(30)),
                        child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white12,
                            child: Icon(
                              Icons.facebook,
                              size: 40,
                              color: Colors.orange,
                            )),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      const url = "https://www.linkedin.com/?";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.orange, width: 2),
                            borderRadius: BorderRadius.circular(30)),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white12,
                          child: Icon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.orange,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      var whatsapp = "0096775430593";
                      var whatsappAndroid = Uri.parse(
                          "whatsapp://send?phone=$whatsapp&text=hello");
                      if (await canLaunchUrl(whatsappAndroid)) {
                        await launchUrl(whatsappAndroid);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("WhatsApp is not installed on the device"),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.orange, width: 2),
                            borderRadius: BorderRadius.circular(30)),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white12,
                          child: Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.orange,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          )
        ],
      ),
      width: double.infinity,
      height: 600,
      decoration: BoxDecoration(color: Colors.black),
    );

//
ReUseAppBarPhone(context,{required Col}) => AppBar(
    backgroundColor: Col,
    actions: [
      Text(
        'Dark mode',
        style: TextStyle(color: Colors.black),
      ),
      Switch(
        focusColor: Colors.indigo.shade800,
        value: MyCubit.get(context ).IsDark,
        onChanged: (value) {
          MyCubit.get(context).ChangeThemeDarkTOLight();
        },
      )
    ],
    toolbarHeight: 80,
    title: Column(children: [
      SizedBox(
        width: 15,
        height: 15,
      ),
      MyCubit.get(context).lasn == 'en'
          ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  // Text('M',
                  //     style: TextStyle(
                  //         color: Colors.indigoAccent.withOpacity(0.9),
                  //         fontSize: 28,
                  //         fontFamily: GoogleFonts.mrDeHaviland().fontFamily,
                  //         textBaseline: TextBaseline.ideographic,
                  //         fontWeight: FontWeight.bold)),
                  Text('Mobevac',
                      style: TextStyle(
                          fontSize: 28,
                          fontFamily: GoogleFonts.mrDeHaviland().fontFamily,
                          textBaseline: TextBaseline.ideographic,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Row(children: [
                    // Text('مـــ',
                    //     style: TextStyle(
                    //         color: Colors.indigoAccent.withOpacity(0.9),
                    //         fontSize: 28,
                    //         fontFamily: GoogleFonts.mrDeHaviland().fontFamily,
                    //         fontWeight: FontWeight.bold)),
                    Text('مـوبيفاك',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: GoogleFonts.mrDeHaviland().fontFamily,
                            fontWeight: FontWeight.bold))
                  ])))
    ]));
