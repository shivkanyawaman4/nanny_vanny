import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

import '../constants/colors.dart';

// ignore: must_be_immutable
class Support extends KFDrawerContent {
  Support({Key? key});

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
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
                  Text('Support'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
