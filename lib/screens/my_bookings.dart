import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

import '../constants/colors.dart';

// ignore: must_be_immutable
class MyBookings extends KFDrawerContent {
  MyBookings({Key? key});

  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
        elevation: 0,
        title: const Text('Main Page'),
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: widget.onMenuPressed,
            child: Icon(
              Icons.arrow_back,
              color: mainColor,
            )),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('My Bookings'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
