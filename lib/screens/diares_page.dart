import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_log/consts/colors.dart';

class DiaresPage extends StatefulWidget {
  const DiaresPage({super.key});

  @override
  State<DiaresPage> createState() => _DiaresPageState();
}

class _DiaresPageState extends State<DiaresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        title: Text(
          'My diares',
          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
