import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_log/consts/colors.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: purple,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 6),
          Image.asset('assets/2.png', scale: 1.3),
          const SizedBox(height: 20),
          Text(
            'Create your own\n custom workouts',
            style: GoogleFonts.inter(
                color: white, fontSize: 34, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          Text(
            'Make your own template and train\n just how you like!',
            style: GoogleFonts.inter(
                color: white, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
