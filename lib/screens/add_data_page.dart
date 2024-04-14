import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workout_log/data/measurments_provider.dart';

import '../consts/colors.dart';

class AddDataPage extends StatefulWidget {
  final int index;
  final String title;
  const AddDataPage({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Image.asset(
                  'assets/4.png',
                  scale: 2,
                ),
                const SizedBox(height: 20),
                Text(
                  'Enter your current data',
                  style: GoogleFonts.inter(
                    color: white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'We recommend logging your measurments\nonce a week',
                  style: GoogleFonts.inter(
                    color: inactiveGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                      color: inactiveGrey,
                      borderRadius: BorderRadius.circular(18)),
                  height: MediaQuery.of(context).size.height / 14,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.inter(
                          color: white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        labelStyle: GoogleFonts.inter(
                            color: white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                FilledButton(
                  onPressed: () => {
                    if (_controller.text != '')
                      {
                        context
                            .read<MeasurmentsProvider>()
                            .setIndex(newIndex: widget.index),
                        context
                            .read<MeasurmentsProvider>()
                            .setData(newData: _controller.text),
                        _controller.clear(),
                        Navigator.pushNamed(context, '/home_page'),
                      }
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(18)),
                    minimumSize: Size(MediaQuery.of(context).size.width - 40,
                        MediaQuery.of(context).size.height / 14),
                  ),
                  child: Text(
                    'Save',
                    style: GoogleFonts.inter(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
