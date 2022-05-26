import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

// ignore: must_be_immutable
class HowItWorks extends KFDrawerContent {
  HowItWorks({Key? key});

  @override
  _HowItWorksState createState() => _HowItWorksState();
}

class _HowItWorksState extends State<HowItWorks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('How It Works'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
