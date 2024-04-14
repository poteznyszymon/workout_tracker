import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_log/screens/add_data_page.dart';
import '../consts/colors.dart';

class MeasurmentsDataTile extends StatefulWidget {
  final int index;
  final String title;
  final String data;
  const MeasurmentsDataTile({
    super.key,
    required this.title,
    required this.data,
    required this.index,
  });

  @override
  State<MeasurmentsDataTile> createState() => _MeasurmentsDataTileState();
}

class _MeasurmentsDataTileState extends State<MeasurmentsDataTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddDataPage(
              title: widget.title,
              index: widget.index,
            ),
          ),
        )
      },
      child: Container(
        decoration: BoxDecoration(
          color: tileGrey,
          borderRadius: BorderRadius.circular(18),
        ),
        height: ((MediaQuery.of(context).size.height / 4) - 63) / 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.inter(
                        color: purple,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  (widget.data == '0')
                      ? Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width / 17,
                          color: Colors.white,
                        )
                      : (widget.title == 'Fat percentage')
                          ? Text(
                              '${widget.data} %',
                              style: GoogleFonts.inter(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          : (widget.title == 'Weight')
                              ? Text(
                                  '${widget.data} kg',
                                  style: GoogleFonts.inter(
                                      color: white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              : Text(
                                  '${widget.data} cm',
                                  style: GoogleFonts.inter(
                                      color: white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
