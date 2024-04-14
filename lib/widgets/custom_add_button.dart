import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAddButton extends StatefulWidget {
  final Color bgColor;
  final Color fontColor;
  final void Function()? onTap;
  final String text;
  const CustomAddButton({
    super.key,
    required this.bgColor,
    required this.fontColor,
    required this.onTap,
    required this.text,
  });

  @override
  State<CustomAddButton> createState() => _CustomAddButtonState();
}

class _CustomAddButtonState extends State<CustomAddButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height / 15),
        elevation: 0,
        backgroundColor: widget.bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(16),
        ),
      ),
      child: Text(
        widget.text,
        style: GoogleFonts.inter(
          color: widget.fontColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
