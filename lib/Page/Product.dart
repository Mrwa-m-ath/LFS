import 'package:cached_network_image/cached_network_image.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:mobex/Page/HomeDesine.dart';
import 'package:url_launcher/url_launcher.dart';

import '../MyBloc/Cubit.dart';
import '../MyBloc/Stat.dart';
import '../main.dart';
import 'AboutUs.dart';
import 'DeskrapProduct.dart';
import 'FireBaseCodes.dart';
import 'HomeInformationpage.dart';
import 'News.dart';

class Product extends StatefulWidget {
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, MyStat>(
      builder: (context, state) => LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Productphone(context);
          } else {
            return ProductFuncomputer(context);
          }
        },
      ),
      listener: (context, state) {},
    );
  }
}

Widget Productphone(context) => Scaffold(backgroundColor: Colors.black,
      appBar: ReUseAppBarPhone(context,Col: Colors.orange.shade600),
      drawer: ReUserDro(context),
      body: ConditionalBuilder(
        builder: (context) => SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    Colors.black45,
                    Colors.orange.shade600,
                    Colors.black87,
                  ],
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomStart)),
              height: 455,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyCubit.get(context).lasn == 'en'
                            ? 'Products'
                            : 'منتجات',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: GoogleFonts.akatab().fontFamily),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          width: 300,
                          height: 60,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                              fillColor: Colors.cyan,
                              hintText: MyCubit.get(context).lasn == 'en'
                                  ? 'Search....'
                                  : 'بحث....',
                              enabledBorder: InputBorder.none,
                              suffixIcon: Icon(Icons.search),
                              suffixStyle: TextStyle(fontSize: 50),
                            )),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
                color: Colors.orange.withOpacity(0.6),
                child: GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1 / 1,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: List.generate(
                        MyCubit.get(context).lasn == 'en'
                            ? ProductionList.length
                            : ProductionList.length,
                        (index) => Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                              // DeskreptionProduct(
                                              //   index: index,
                                              // )));
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (context) {
                                  //   Navigator.push(context, MaterialPageRoute(builder: (context) =>  ));
                                  //       };
                                  //
                                  // showDialogWidgetPJ(
                                  // ProductionListAr[index],
                                  // ProductionList[index],
                                  // context));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 265,
                                    height: 350,
                                    decoration: BoxDecoration(
                                        color: Colors.orange.withOpacity(0.3),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9)),
                                        border: Border.all(
                                            color: Colors.blue.shade50
                                                .withOpacity(0.1))),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: CachedNetworkImage(
                                                imageUrl:
                                                    "${ProductionList[index]['Image']}",
                                                width: 300,
                                                height: 200,
                                                imageBuilder: (context,
                                                        imageProvider) =>
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image:
                                                                imageProvider,
                                                            fit: BoxFit.contain,
                                                            colorFilter:
                                                                ColorFilter.mode(
                                                                    Colors.blue
                                                                        .shade50,
                                                                    BlendMode
                                                                        .colorBurn)),
                                                      ),
                                                    ),
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                      strokeWidth: 9,
                                                      color: Colors.black,
                                                      backgroundColor:
                                                          Colors.indigo,
                                                    )),
                                                // placeholder: (context, url) => CircularProgressIndicator(),
                                                errorWidget: (context, url,
                                                        error) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                      strokeWidth: 9,
                                                      color: Colors.black,
                                                      backgroundColor:
                                                          Colors.indigo,
                                                    ))),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            MyCubit.get(context).lasn == 'en'
                                                ? Text(
                                                    '${ProductionList[index]['Name']}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold))
                                                : Text(
                                                    '${ProductionListAr[index]['Name']}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            Spacer(),
                                            MyCubit.get(context).lasn == 'en'
                                                ? Text('See More ..',
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold))
                                                : Text('المزيد...',
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )))),
            SizedBox(
              height: 60,
            ),
            EdfDrowerForPhone(context) //
          ],
        )),
        fallback: (context) => Center(child: CircularProgressIndicator()),
        condition: ProductionList != null,
      ),
    );

Widget ProductFuncomputer(BuildContext context) => Scaffold(
  backgroundColor:Colors.black,
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            // SliverAppBar(
            //   backgroundColor: Colors.grey.shade600,
            //   excludeHeaderSemantics: true,
            //   stretch: true,
            //   automaticallyImplyLeading: false,
            //   actions: [
            //     Text(
            //       'Dark mode',
            //       style: TextStyle(color: Colors.black),
            //     ),
            //     Switch(
            //       focusColor: Colors.indigo.shade800,
            //       value: MyCubit.get(context).IsDark,
            //       onChanged: (value) {
            //         MyCubit.get(context).ChangeThemeDarkTOLight();
            //       },
            //     ),
            //     InkWell(
            //       child: Container(
            //           height: 40,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(25),
            //               color: Colors.white,
            //               border: Border.all(color: Colors.black45)),
            //           child: Padding(
            //             padding: const EdgeInsets.all(10.0),
            //             child: Row(
            //               children: [
            //                 Text(
            //                     MyCubit.get(context).lasn == 'en'
            //                         ? 'Country sites'
            //                         : 'موقعنا ',
            //                     style: TextStyle(
            //                       color: Colors.black,
            //                       fontSize: 13,
            //                     )),
            //                 Icon((Icons.location_on))
            //               ],
            //             ),
            //           )),
            //       onTap: () {
            //         MapsLauncher.launchQuery('مصنع مبيدكو');
            //       },
            //     ),
            //     SizedBox(
            //       width: 15,
            //     ),
            //     InkWell(
            //         child: Container(
            //             height: 40,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(25),
            //                 color: Colors.white,
            //                 border: Border.all(color: Colors.black45)),
            //             child: Padding(
            //               padding: const EdgeInsets.all(10.0),
            //               child: Row(
            //                 children: [
            //                   Text(
            //                       MyCubit.get(context).lasn == 'en'
            //                           ? 'Contact Us'
            //                           : 'تواصل معنا',
            //                       style: TextStyle(
            //                         color: Colors.black,
            //                         fontSize: 13,
            //                       )),
            //                   Icon((Icons.phone))
            //                 ],
            //               ),
            //             )),
            //         onTap: () async {
            //           final call = Uri.parse('tel:+91 9830268966');
            //           if (await canLaunchUrl(call)) {
            //             launchUrl(call);
            //           } else {
            //             throw 'Could not launch $call';
            //           }
            //           ;
            //         })
            //   ],
            //   toolbarHeight: 100,
            //   title: Column(
            //     children: [
            //       Padding(
            //           padding: EdgeInsets.all(15.0),
            //           child: MyCubit.get(context).lasn == 'en'
            //               ? Container(
            //                   alignment: Alignment.topRight,
            //                   child: Row(
            //                     children: [
            //                       Text('M',
            //                           style: TextStyle(
            //                               color: Colors.deepPurple
            //                                   .withOpacity(0.9),
            //                               fontSize: 55,
            //                               fontFamily: GoogleFonts.mrDeHaviland()
            //                                   .fontFamily,
            //                               textBaseline:
            //                                   TextBaseline.ideographic,
            //                               fontWeight: FontWeight.bold)),
            //                       Text('obevac',
            //                           style: TextStyle(
            //                               color: Colors.black,
            //                               fontSize: 30,
            //                               fontWeight: FontWeight.bold))
            //                     ],
            //                   ),
            //                 )
            //               : Container(
            //                   alignment: Alignment.topRight,
            //                   child: Row(
            //                     children: [
            //                       Text('مــــ',
            //                           style: TextStyle(
            //                               color: Colors.deepPurple
            //                                   .withOpacity(0.9),
            //                               fontSize: 35,
            //                               fontFamily: GoogleFonts.mrDeHaviland()
            //                                   .fontFamily,
            //                               textBaseline:
            //                                   TextBaseline.ideographic,
            //                               fontWeight: FontWeight.bold)),
            //                       Text('ـوـبيفاك',
            //                           style: TextStyle(
            //                               color: Colors.black,
            //                               fontSize: 35,
            //                               fontFamily: GoogleFonts.mrDeHaviland()
            //                                   .fontFamily,
            //                               fontWeight: FontWeight.bold)),
            //                     ],
            //                   ),
            //                 )),
            //       SizedBox(
            //         width: 100,
            //       ),
            //     ],
            //   ),
            // ),
          ];
        },
        body: ConditionalBuilder(
          builder: (context) => SingleChildScrollView(
              child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                      Colors.black45,
                      Colors.orange.shade300,
                      Colors.black87,
                    ],
                        begin: AlignmentDirectional.bottomStart,
                        end: AlignmentDirectional.topCenter)),
                height: 455,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          MyCubit.get(context).lasn == 'en'
                              ? 'Products'
                              : 'منتجات',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: GoogleFonts.akatab().fontFamily),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                            width: 300,
                            height: 60,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                fillColor: Colors.cyan,
                                hintText: MyCubit.get(context).lasn == 'en'
                                    ? 'Search....'
                                    : 'بحث .......',
                                enabledBorder: InputBorder.none,
                                suffixIcon: Icon(Icons.search),
                                suffixStyle: TextStyle(fontSize: 50),
                              )),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(30.0),
              //   child: Container(
              //     alignment: AlignmentDirectional.centerEnd,
              //     width: 850,
              //     height: 80,
              //     decoration: BoxDecoration(
              //       color: Colors.blue.withOpacity(0.4),
              //       borderRadius: BorderRadius.circular(0.30),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Row(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Expanded(
              //             child: Container(
              //                 width: 150,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(0.12)),
              //                 child: InkWell(
              //                   child: Text('MobeVace',
              //                       style: TextStyle(
              //                           color: Colors.white, fontSize: 19)),
              //                   onTap: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                           builder: (context) =>
              //                               HomeInformationpage(),
              //                         ));
              //                   },
              //                 )),
              //           ),
              //           Expanded(
              //             child: Container(
              //                 width: 150,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(0.2)),
              //                 child: InkWell(
              //                   child: Text('Who We Are',
              //                       style: TextStyle(
              //                           color: Colors.white, fontSize: 19)),
              //                   onTap: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                           builder: (context) => AboutUs(),
              //                         ));
              //                   },
              //                 )),
              //           ),
              //           Expanded(
              //             child: Container(
              //               width: 150,
              //               child: DropdownButton2(
              //                 alignment: Alignment.center,
              //                 iconStyleData: IconStyleData(
              //                   iconEnabledColor: Colors.indigo.shade500,
              //                   iconSize: 30,
              //                 ),
              //                 underline: Text(''),
              //                 barrierDismissible: true,
              //                 style: Theme.of(context).textTheme.displaySmall,
              //                 dropdownStyleData: DropdownStyleData(
              //                   useSafeArea: true,
              //                   maxHeight: 200,
              //                   width: 200,
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(14),
              //                       color: Colors.indigo.shade50),
              //                   scrollbarTheme: ScrollbarThemeData(
              //                     radius: const Radius.circular(40),
              //                     thickness: MaterialStateProperty.all(6),
              //                     thumbVisibility:
              //                         MaterialStateProperty.all(true),
              //                   ),
              //                 ),
              //                 items: [
              //                   DropdownMenuItem(
              //                     child: MaterialButton(
              //                         child: Text(
              //                             MyCubit.get(context).lasn == 'en'
              //                                 ? 'Animal Health'
              //                                 : 'صحة الحيوان',
              //                             style: Theme.of(context)
              //                                 .textTheme
              //                                 .displaySmall),
              //                         onPressed: () {
              //                           {
              //                             showDialog(
              //                               context: context,
              //                               builder: (context) => Product(),
              //                             );
              //                           }
              //                         }),
              //                     enabled: false,
              //                   ),
              //                   DropdownMenuItem(
              //                     child: MaterialButton(
              //                         child: Text(
              //                             MyCubit.get(context).lasn == 'en'
              //                                 ? 'Pesticides'
              //                                 : 'مبيدات حشرية',
              //                             style: Theme.of(context)
              //                                 .textTheme
              //                                 .displaySmall),
              //                         onPressed: () {}),
              //                     enabled: false,
              //                   ),
              //                 ],
              //                 value: null,
              //                 onChanged: (s) {},
              //                 hint: Text(
              //                     MyCubit.get(context).lasn == 'en'
              //                         ? 'What we do'
              //                         : 'الذي نفعله ',
              //                     style: TextStyle(
              //                         color: Colors.white, fontSize: 19)),
              //               ),
              //             ),
              //           ),
              //           Expanded(
              //             child: Container(
              //                 alignment: Alignment.center,
              //                 width: 140,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(0.2)),
              //                 child: InkWell(
              //                   child: Text(
              //                     'News',
              //                     style: TextStyle(
              //                         fontSize: 19, color: Colors.white),
              //                   ),
              //                   onTap: () {
              //                     Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                         builder: (context) => Newss(),
              //                       ),
              //                     );
              //                   },
              //                 )),
              //           ),
              //           Expanded(
              //             child: Container(
              //               width: 150,
              //               child: DropdownButton2(
              //                 isDense: true,
              //                 underline: Text(''),
              //                 alignment: Alignment.center,
              //                 iconStyleData: IconStyleData(
              //                   iconEnabledColor: Colors.indigo.shade500,
              //                   iconSize: 30,
              //                 ),
              //                 barrierDismissible: true,
              //                 style: TextStyle(
              //                     color: Colors.black,
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.w600),
              //                 buttonStyleData: ButtonStyleData(
              //                     decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.circular(
              //                   0.1,
              //                 ))),
              //                 dropdownStyleData: DropdownStyleData(
              //                   useSafeArea: true,
              //                   maxHeight: 200,
              //                   width: 200,
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(14),
              //                       color: Colors.indigo.shade50),
              //                   scrollbarTheme: ScrollbarThemeData(
              //                     radius: const Radius.circular(40),
              //                     thickness: MaterialStateProperty.all(6),
              //                     thumbVisibility:
              //                         MaterialStateProperty.all(true),
              //                   ),
              //                 ),
              //                 items: [
              //                   DropdownMenuItem(
              //                     enabled: false,
              //                     child: ConditionalBuilder(
              //                       fallback: (context) => Center(
              //                         child: CircularProgressIndicator(),
              //                       ),
              //                       builder: (context) => TextButton(
              //                           child: Text('En',
              //                               style: Theme.of(context)
              //                                   .textTheme
              //                                   .displaySmall),
              //                           onPressed: () {
              //                             AnimationController? controller;
              //                             MyCubit.get(context)
              //                                 .ChangLanguageToEnglish();
              //                           }),
              //                       condition:
              //                           MyCubit.get(context).lasn == 'en',
              //                     ),
              //                   ),
              //                   DropdownMenuItem(
              //                     enabled: false,
              //                     child: TextButton(
              //                         child: Text('ar',
              //                             style: Theme.of(context)
              //                                 .textTheme
              //                                 .displaySmall),
              //                         onPressed: () {
              //                           MyCubit.get(context)
              //                               .ChangeLanguageToArabic(context);
              //                         }),
              //                   )
              //                 ],
              //                 value: null,
              //                 onChanged: (s) {},
              //                 hint: Text(
              //                     MyCubit.get(context).lasn == 'en'
              //                         ? 'Change Lan'
              //                         : 'تغيير اللغه ',
              //                     style: TextStyle(
              //                         color: Colors.white, fontSize: 19)),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                    color: Colors.orange.withOpacity(0.6),
                    child: GridView.count(
                        crossAxisSpacing: 50,
                        shrinkWrap: true,
                        mainAxisSpacing: 50,
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: 1 / 1,
                        crossAxisCount: 3,
                        children: List.generate(
                            MyCubit.get(context).lasn == 'en'
                                ? ProductionList.length
                                : ProductionList.length,
                            (index) => InkWell(
                                  onTap: () {
                          showDialog(
                               context: context,
                               builder: (context) => Padding(
                                 padding: const EdgeInsets.all(50.0),
                                 child: Container(width: 300,height: 100,
                                   decoration: BoxDecoration(color: Colors.orangeAccent,
                                       borderRadius: BorderRadius.all(
                                           Radius.circular(100))),
                                 ),
                               ),
                             );
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             DeskreptionProduct(
                                    //               index: index,
                                    //             )));
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 3),
                                    height: 300,
                                    width: 400,
                                    decoration: BoxDecoration(
                                        color: Colors.orange.withOpacity(0.3),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9)),
                                        border: Border.all(
                                            color: Colors.blue.shade50
                                                .withOpacity(0.1))),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: Container(
                                                      child: CachedNetworkImage(
                                                          width: 400,
                                                          height: 150,
                                                          imageUrl:
                                                              "${ProductionList[index]['Image']}",
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image:
                                                                          imageProvider,
                                                                      fit: BoxFit
                                                                          .fitWidth,
                                                                      colorFilter: ColorFilter.mode(
                                                                          Colors
                                                                              .orange
                                                                              .shade100,
                                                                          BlendMode
                                                                              .colorBurn)),
                                                                ),
                                                              ),
                                                          placeholder: (context,
                                                                  url) =>
                                                              Center(
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                strokeWidth: 9,
                                                                color: Colors
                                                                    .black,
                                                                backgroundColor:
                                                                    Colors
                                                                        .orange,
                                                                strokeAlign: 13,
                                                              )),
                                                          // placeholder:
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Center(
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                strokeWidth: 9,
                                                                color: Colors
                                                                    .black,
                                                                backgroundColor:
                                                                    Colors
                                                                        .orange,
                                                              ))),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        MyCubit.get(context)
                                                                    .lasn ==
                                                                'en'
                                                            ? '${ProductionList[index]['Name']}'
                                                            : '${ProductionListAr[index]['Name']}',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    Spacer(),
                                                    Text(
                                                        MyCubit.get(context)
                                                                    .lasn ==
                                                                'en'
                                                            ? 'See More ..'
                                                            : 'المزيد...',
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )))),
              ),
              SizedBox(
                height: 60,
              ),

              ///
              /// /
              /// /
              EndDrowerForComputer(context)
            ],
          )),
          fallback: (context) => Center(child: CircularProgressIndicator()),
          condition: ProductionList != null,
        ),
      ),
    ); //pc
