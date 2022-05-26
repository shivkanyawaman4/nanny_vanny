import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

// ignore: must_be_immutable
class WhyNannyVanny extends KFDrawerContent {
  WhyNannyVanny({Key? key});

  @override
  _WhyNannyVannyState createState() => _WhyNannyVannyState();
}

class _WhyNannyVannyState extends State<WhyNannyVanny> {
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
                  Text('How Nanny Vanny'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
