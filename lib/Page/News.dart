import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'package:url_launcher/url_launcher.dart';
import '../MyBloc/Cubit.dart';
import '../MyBloc/Stat.dart';
import 'AboutUs.dart';
import 'FireBaseCodes.dart';
import 'HomeDesine.dart';
import 'HomeInformationpage.dart';
import 'Product.dart';

class Newss extends StatefulWidget {
  @override
  State<Newss> createState() => _NewssState();
}

class _NewssState extends State<Newss> {
  @override
  Future SHO() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
  }



  void initState() {
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, MyStat>(
      builder: (context, state) => Scaffold(
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.indigo.shade200),
          child: ConditionalBuilder(
            builder: (context) => LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 700) {
                  return PcContact(context);
                } else {
                  return PhoneContact(context);
                }
              },
            ),
            condition: true,
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
      listener: (BuildContext context, MyStat state) {},
    );
  }
}

PcContact(context) => Scaffold(
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

      body: NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) {return <Widget>[

      ];},
         body: ConditionalBuilder(
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(width: double.infinity,child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image( image: NetworkImage( NewsMobeVac[1]['Imagee']),fit: BoxFit.cover,),
                  )
                  )   ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                            color: Colors.black.withOpacity(0.3),
                            child: GridView.count(
                                shrinkWrap: true,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 1,
                                childAspectRatio:2.60 / 1.8,
                                physics: ScrollPhysics(),
                                crossAxisCount: 2,
                                children: List.generate(
                                    NewsMobeVac.length,
                                    // MyCubit.get(context).lasn=='en'?     ProductionList.length:     ProductionList.length,

                                    (index) => PcWedget(
                                        NewsMobeVac[index], context, index)))),
                      ),
                    ),
                  ],
                ),
                EndDrowerForComputer(context)
              ],
            ),
          ),
          condition: true,
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
PhoneContact(context) => Scaffold(
    backgroundColor: Colors.black,
    appBar: ReUseAppBarPhone(context, Col: Colors.orange.shade500),
    drawer: ReUserDro(context),
    body: ConditionalBuilder(
      builder: (context) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(width: double.infinity,child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image( image: NetworkImage( NewsMobeVac[1]['Imagee']),fit: BoxFit.cover,),
                )
                )   ),
            Container(
                color: Colors.black,
                child: GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8 / 1,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 1,
                    children: List.generate(
                        NewsMobeVac.length,
                        // MyCubit.get(context).lasn=='en'?     ProductionList.length:     ProductionList.length,

                        (index) => phoneWedget(
                            NewsMobeVac[index], context, index)))),
            EdfDrowerForPhone(context)
          ],
        ),
      ),
      condition: true,
      fallback: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    ));
Widget phoneWedget(newsMobeVac, context, index) => Padding(
      padding: const EdgeInsets.all(60.0),
      child: InkWell(
        onTap: () {
          showDialog(
            useSafeArea: true,
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(80.0),
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 400,
                    color: Colors.blueGrey.withOpacity(0.9),
                  ),
                ),
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(0.4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.centerRight,
                        width: double.infinity,
                        height: 130,
                        color: Colors.black,
                        child: Icon(
                          Icons.newspaper_sharp,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    newsMobeVac['New'] == 'New'
                        ? Padding(
                            padding: EdgeInsets.all(20),
                            child: Container(
                              width: 90,
                              height: 49,
                              child: Text(newsMobeVac['New'],
                                  style: TextStyle(color: Colors.white)),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(0.7)),
                            ))
                        : Container(),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          MyCubit.get(context).lasn == 'en'
                              ? newsMobeVac['DesNew']
                              : newsMobeVac['DesNewA'],
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                          maxLines: 2,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          MyCubit.get(context).lasn == 'en'
                              ? newsMobeVac['Title']
                              : newsMobeVac['TitleA'],
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(newsMobeVac['Data'],
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17)),
                          ),
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
Widget PcWedget(newsMobeVac, context, int index)=>Padding(
  padding: const EdgeInsets.all(11.0),
  child: Container(
    child: Column(
      children: [
        Expanded(
          child: Container(color: Colors.orange.withOpacity(0.6)
            ,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [
              Container(color: Colors.orangeAccent,height:100,width :double.infinity,child:Row(
                children: [  Expanded(
                  child: Text(
                    MyCubit.get(context).lasn == 'en'
                        ? newsMobeVac['Title']
                        : newsMobeVac['TitleA'], maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                 Icon(
                    Icons.newspaper_sharp,
                    size: 60,
                    color: Colors.orange.shade900,
                    )
                ],
              )),    SizedBox(height: 5,),  newsMobeVac['New'] == 'New'
                  ? Padding(
                  padding: EdgeInsets.all(3),
                  child: Container(
                    width: 90,
                    height: 49,
                    child: Text(newsMobeVac['New'],
                        style: TextStyle(color: Colors.white)),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(     color: Colors. black.withOpacity(0.3),

                        borderRadius: BorderRadius.circular(0.7)),
                  ))
                  : Container(     color: Colors. black.withOpacity(0.3),),
    Expanded(
    child:          Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    MyCubit.get(context).lasn == 'en'
                        ? newsMobeVac['DesNew']
                        : newsMobeVac['DesNewA'],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    maxLines: 3,
                  ))),

            ],),
          ),
        ),
      ],
    ),
  ),
);
// Widget s(newsMobeVac, context, int index) => InkWell(
//       onTap: () {
//         showDialog(
//           useSafeArea: true,
//           context: context,
//           builder: (context) => Padding(
//             padding: const EdgeInsets.all(80.0),
//             child: Container(
//
//               child: Padding(
//                 padding:   EdgeInsets.all(8.0),
//                 child: Container(
//                   height: 150,
//                   width: 400,
//
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 color: Colors.white,
//                 child: Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors. orange.withOpacity(0.9),
//                         borderRadius: BorderRadius.circular(0.4)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding:   EdgeInsets.all(20.0),
//                             child: Container(
//                               alignment: Alignment.centerRight,
//                               width: double.infinity,
//                               height: 150,
//                               color: Colors. black.withOpacity(0.3),
//                               child: Icon(
//                                 Icons.newspaper_sharp,
//                                 size: 100,
//                                 color: Colors.green,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             MyCubit.get(context).lasn == 'en'
//                                 ? newsMobeVac['Title']
//                                 : newsMobeVac['Title'],
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         newsMobeVac['New'] == 'New'
//                             ? Padding(
//                                 padding: EdgeInsets.all(3),
//                                 child: Container(
//                                   width: 90,
//                                   height: 49,
//                                   child: Text(newsMobeVac['New'],
//                                       style: TextStyle(color: Colors.white)),
//                                   alignment: Alignment.center,
//                                   decoration: BoxDecoration(     color: Colors. black.withOpacity(0.3),
//
//                                       borderRadius: BorderRadius.circular(0.7)),
//                                 ))
//                             : Container(     color: Colors. black.withOpacity(0.3),),
//                         Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               MyCubit.get(context).lasn == 'en'
//                                   ? newsMobeVac['DesNew']
//                                   : newsMobeVac['DesNewA'],
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w400),
//                               maxLines: 2,
//                             )),
//                         Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               MyCubit.get(context).lasn == 'en'
//                                   ? newsMobeVac['Title']
//                                   : newsMobeVac['TitleA'],
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold),
//                             )),
//                         SizedBox(
//                           height: 12,
//                         ),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.all(8),
//                               child: Text(newsMobeVac['Data'],
//                                   style: TextStyle(
//                                       color: Colors.black54,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 17)),
//                             ),
//                             Spacer(),
//                             CircleAvatar(
//                               child: Icon(
//                                 Icons.arrow_forward_ios_sharp,
//                                 color: Colors.white,
//                               ),
//                               backgroundColor: Colors.orange,
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
