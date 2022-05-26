import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/colors.dart';

class Widgets {
  static profile({required BuildContext context, required String img}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      width: size.width * 0.2,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: mainColor, width: 2),
          image:
              DecorationImage(image: NetworkImage(img), fit: BoxFit.contain)),
    );
  }

  static Widget name({ required String name}) {
    return Text(name,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: mainColor,
            fontFamily: GoogleFonts.alegreyaSans().fontFamily));
  }
}
