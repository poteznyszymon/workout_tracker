import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../consts/colors.dart';

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: purple,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 6),
          Image.asset('assets/3.png', scale: 1.4),
          const SizedBox(height: 30),
          Text(
            'Suits personal\ntrainers',
            style: GoogleFonts.inter(
                color: white, fontSize: 34, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width / 12),
              Text(
                'No more notebooks and penicls\nCreate your workout and log\nyour progress',
                style: GoogleFonts.inter(
                    color: white, fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
