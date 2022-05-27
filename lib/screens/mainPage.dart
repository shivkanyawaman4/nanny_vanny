import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:navnny_vanny/screens/home.dart';

import '../constants/colors.dart';

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

  int _selectedIndex = 0;
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
          child: IndexedStack(
        children: [Home(), Home(), Home(), Home()],
      )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(color: mainColor),
        selectedItemColor: mainColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: ImageIcon(
              AssetImage('assets/discount.png'),
            ),
            icon: Icon(
              Icons.home,
            ),
            label: 'Packages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
      ),
    );
  }
}
