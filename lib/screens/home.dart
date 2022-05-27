import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:navnny_vanny/api/api.dart';
import 'package:navnny_vanny/modals/package_modal.dart';

import '../constants/colors.dart';
import '../widgets.dart';

// ignore: must_be_immutable
class Home extends KFDrawerContent {
  Home({Key? key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget columnWidget(
      {required String text, required String date, required String time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline5!
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
    required String icon,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: blueColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Row(
          children: [
            ImageIcon(
              AssetImage(icon),
              size: 14,
              color: Colors.white,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              textScaleFactor: 1.1,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )),
    );
  }

  final int _selectedIndex = 0;
  PackageModal packageModal = PackageModal();
  bool showData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiServices.getRequest().then((value) {
      if (value != null) {
        packageModal = PackageModal.fromJson(value);
        setState(() {
          showData = true;
        });
      } else {
        setState(() {
          showData = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(packageModal.currentBookings);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Widgets.profile(
                      context: context,
                      img:
                          'https://www.freeiconspng.com/thumbs/female-icon/female-icon-11.jpg'),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.04),
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
                child: showData
                    ? Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    packageModal.currentBookings!.packageLabel!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
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
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.04),
                                child: Row(
                                  children: [
                                    columnWidget(
                                      text: 'From',
                                      date: packageModal
                                          .currentBookings!.fromDate!,
                                      time: packageModal
                                          .currentBookings!.fromTime!,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.12,
                                    ),
                                    columnWidget(
                                      text: 'To',
                                      date:
                                          packageModal.currentBookings!.toDate!,
                                      time:
                                          packageModal.currentBookings!.toTime!,
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildButton(
                                    text: 'Rate Us',
                                    icon: 'assets/star.png',
                                  ),
                                  buildButton(
                                    text: 'Geolocation',
                                    icon: 'assets/pin.png',
                                  ),
                                  buildButton(
                                    text: 'Survillence',
                                    icon: 'assets/radio.png',
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        ),
                      ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  'Packages',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(22.0),
              sliver: showData
                  ? packageModal.packages!.isNotEmpty
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => SizedBox(
                              child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Container(
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      color: index % 2 == 0
                                          ? const Color(0xFFF0B3CD)
                                          : const Color(0xFF80ABDB),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ImageIcon(
                                                AssetImage(packageModal
                                                            .packages![index]
                                                            .packageName! ==
                                                        'Weekend Package'
                                                    ? 'assets/calendar1/png'
                                                    : 'assets/calendar.png'),
                                                color: index % 2 == 0
                                                    ? mainColor
                                                    : Colors.white,
                                              ),
                                              Widgets.button(
                                                  onTap: () {},
                                                  context: context,
                                                  text: 'Book Now',
                                                  color: index % 2 == 0
                                                      ? mainColor
                                                      : const Color(0xFF0098D0))
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: size.height * 0.02),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  packageModal.packages![index]
                                                      .packageName!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4!
                                                      .copyWith(
                                                          color: blueColor,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                                Text(
                                                  packageModal
                                                      .packages![index].price!
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4!
                                                      .copyWith(
                                                          color: blueColor,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                )
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.7,
                                                child: Text(
                                                  packageModal.packages![index]
                                                      .description!,
                                                  textAlign: TextAlign.justify,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6,
                                                  softWrap: true,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            childCount: packageModal.packages!.length,
                          ),
                        )
                      : SliverToBoxAdapter(child: const Center(child: Text('No Package Available')))
                  : SliverToBoxAdapter(
                    child: Center(
                        child: CircularProgressIndicator(
                        color: mainColor,
                      )),
                  ),
            ),
          ],
        ),
      )),
    );
  }
}
