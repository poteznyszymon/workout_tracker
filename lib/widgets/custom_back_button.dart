import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../consts/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: Container(
        alignment: const Alignment(0, 1),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home_page');
          },
          style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height / 15),
              elevation: 0,
              backgroundColor: purple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(16))),
          child: Text(
            'Back',
            style: GoogleFonts.inter(
              color: white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
