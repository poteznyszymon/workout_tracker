import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_log/consts/colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height / 15),
          elevation: 0,
          backgroundColor: white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(16))),
      child: Text(
        'Continue',
        style: GoogleFonts.inter(
          color: purple,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
