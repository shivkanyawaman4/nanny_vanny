import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:navnny_vanny/constants/colors.dart';

// ignore: must_be_immutable
class BookNanny extends KFDrawerContent {
  BookNanny({Key? key});

  @override
  _BookNannyState createState() => _BookNannyState();
}

class _BookNannyState extends State<BookNanny> {
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
                  Text('Book Nanny'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
