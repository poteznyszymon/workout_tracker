import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_log/consts/colors.dart';

class WorkoutTile extends StatefulWidget {
  final String name;
  final void Function()? onTap;
  const WorkoutTile({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  State<WorkoutTile> createState() => _WorkoutTileState();
}

class _WorkoutTileState extends State<WorkoutTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: tileGrey,
        ),
        height: ((MediaQuery.of(context).size.height / 4) - 70) / 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.name,
                  style: GoogleFonts.inter(
                    color: white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                onPressed: widget.onTap,
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
