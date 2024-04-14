import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../consts/colors.dart';

class DiaresTile extends StatelessWidget {
  const DiaresTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/diares_page');
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 11,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: tileGrey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.menu_book_sharp,
                      color: purple,
                      size: 25,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'My Diares',
                      style: GoogleFonts.inter(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: purple,
                  size: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
