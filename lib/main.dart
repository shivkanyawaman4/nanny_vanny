import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:navnny_vanny/constants/colors.dart';
import 'package:navnny_vanny/screens/book_nanny.dart';
import 'package:navnny_vanny/screens/how_it_works.dart';
import 'package:navnny_vanny/screens/mainPage.dart';

import 'constants/class_builder.dart';
import 'constants/decorations.dart';
import 'widgets.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: GoogleFonts.alegreyaSans().fontFamily,
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              headline6: const TextStyle(
                fontSize: 10,
                color: Color(0xFF494949),
                fontWeight: FontWeight.w400,
              ),
              headline5: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              headline4: TextStyle(
                fontSize: 16,
                color: mainColor,
                fontWeight: FontWeight.w500,
              ),
              headline3: TextStyle(
                  fontSize: 18, color: blueColor, fontWeight: FontWeight.bold),
              headline2: TextStyle(
                  fontSize: 20,
                  color: blueColor,
                  fontWeight: FontWeight.w900))),
      home: const MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('MainPage'),
      items: [
        KFDrawerItem.initWithPage(
          text: Column(
            children: [
              Text('Home', style: drawerTextStyle),
            ],
          ),
          
          page: MainPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Book Nanny', style: drawerTextStyle),
          page: BookNanny(),
        ),
        KFDrawerItem.initWithPage(
          text: Column(
            children: [
              Text('How It Work', style: drawerTextStyle),
            ],
          ),
          page: HowItWorks(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Why Nanny Vanny', style: drawerTextStyle),
          page: HowItWorks(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('My Bookings', style: drawerTextStyle),
          page: HowItWorks(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('My Profile', style: drawerTextStyle),
          page: HowItWorks(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Support', style: drawerTextStyle),
          page: HowItWorks(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: KFDrawer(
        //  borderRadius: 30.0,
        //  shadowBorderRadius: 30.0,
        //  menuPadding: EdgeInsets.all(30.0),
        //  scrollable: true,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding:   EdgeInsets.symmetric(horizontal: size.width * 0.2),
            child: Column(
              children: [
                Widgets.profile(
                    context: context,
                    img:
                        'https://www.freeiconspng.com/thumbs/female-icon/female-icon-11.jpg'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  child: Widgets.name(name: 'Emily Cyrus'),
                ),
              ],
            ),
          ),
        ),
        // footer: KFDrawerItem(
        //   text: const Text(
        //     'SIGN IN',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   icon: const Icon(
        //     Icons.input,
        //     color: Colors.white,
        //   ),
        //   // onPressed: () {
        //   //   Navigator.of(context).push(CupertinoPageRoute(
        //   //     fullscreenDialog: true,
        //   //     builder: (BuildContext context) {
        //   //       return AuthPage();
        //   //     },
        //   //   )
        //   //   );
        //   // },
        // ),
        decoration: const BoxDecoration(
          color: Colors.white
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [
          //     Color.fromRGBO(255, 255, 255, 1.0),
          //     Color.fromRGBO(44, 72, 171, 1.0)
          //   ],
          //   tileMode: TileMode.repeated,
          // ),
        ),
      ),
    );
  }
}
