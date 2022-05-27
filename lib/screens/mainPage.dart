import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kf_drawer/kf_drawer.dart';

import '../constants/colors.dart';
import '../widgets.dart';

// ignore: must_be_immutable
class MainPage extends KFDrawerContent {
  MainPage({Key? key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget columnWidget(
      {required String text, required String date, required String time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Icon(
                Icons.calendar_month_outlined,
                color: mainColor,
                size: 18,
              ),
            
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  date,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: const Color(0xFF5C5C5C)),
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.watch_later_outlined,
              color: mainColor,
              size: 18,
            ),
            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),

              child: Text(
                time,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: const Color(0xFF5C5C5C)),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildButton({
    required String text,
    // required String icon,
  }) {
    return Container(
      
    
      decoration: BoxDecoration(
          color: blueColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
            child: Row(
        children: [
            const Icon(Icons.settings_voice_rounded),
            Text(
              text,
              textScaleFactor: 1.1,
              style: Theme.of(context).textTheme.headline6,
            ),
        ],
      ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Main Page'),
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            onTap: widget.onMenuPressed,
            child: Image.asset(
              'assets/menuButton.png',
              height: 30,
              width: 40,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Widgets.profile(
                    context: context,
                    img:
                        'https://www.freeiconspng.com/thumbs/female-icon/female-icon-11.jpg'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontFamily: GoogleFonts.alegreyaSans().fontFamily,
                          )),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Widgets.name(name: 'Emily Cyrus'),
                    ],
                  ),
                )
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: size.height * 0.38,
              width: double.infinity,
              // color: Colors.amber,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: size.height * 0.25,
                    width: size.width * 0.86,
                    decoration: const BoxDecoration(
                        color: Color(0xFFF5B5CF),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Nanny And\nBaby sitting Service',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.04),
                              child: Widgets.button(
                                  onTap: () {},
                                  context: context,
                                  text: 'Book Now',
                                  color: blueColor))
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    left: 5,
                    child: Image.asset(
                      'assets/nanny.png',
                      height: size.height * 0.47,
                      width: size.width,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                'Your Current Booking',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'One Day Package',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      color: mainColor,
                                    ),
                          ),
                          Widgets.button(
                              onTap: () {},
                              context: context,
                              text: 'Start',
                              color: mainColor)
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.04),
                        child: Row(
                          children: [
                            columnWidget(
                                text: 'From',
                                date: '12.08.2020',
                                time: '12.08.2020'),
                            SizedBox(
                              width: size.width * 0.12,
                            ),
                            columnWidget(
                                text: 'To',
                                date: '12.08.2020',
                                time: '12.08.2020')
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          buildButton(
                            text: 'Rate Us',
                          ),
                          buildButton(
                            text: 'Geolocation',
                          ),
                          buildButton(
                            text: 'Survillence',
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
