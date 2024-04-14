import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_log/consts/colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Text(
          'Settings\n to do',
          style: GoogleFonts.inter(
              color: white, fontSize: 60, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
