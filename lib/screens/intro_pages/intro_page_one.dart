import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../consts/colors.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: purple,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 6),
          Image.asset('assets/1.png', scale: 1.1),
          const SizedBox(height: 20),
          Text(
            'Log and track your\nworkouts',
            style: GoogleFonts.inter(
                color: white, fontSize: 34, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          Text(
            'Log every set and observe how you\nbecome better and stronger',
            style: GoogleFonts.inter(
                color: white, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
