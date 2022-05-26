import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kf_drawer/kf_drawer.dart';

import '../widgets.dart';

// ignore: must_be_immutable
class MainPage extends KFDrawerContent {
  MainPage({Key? key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                height: size.height * 0.34,

                // color: Colors.amber,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: size.height * 0.22,
                      width: size.width * 0.8,
                      decoration: const BoxDecoration(
                          color: Color(0xFFF5B5CF),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Nanny And\nBaby sitting Service'),
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                              onPressed: () {}, child: const Text('Book Now'))
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -45,
                      left: -30,
                      child: Image.asset(
                        'assets/nanny.png',
                        height: size.height * 0.47,
                        width: size.width,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
