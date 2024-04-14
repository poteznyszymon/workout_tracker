import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:workout_log/consts/colors.dart';
import 'package:workout_log/widgets/custom_add_button.dart';

import '../data/data_base.dart';

class NewWorkoutPage extends StatefulWidget {
  const NewWorkoutPage({super.key});

  @override
  State<NewWorkoutPage> createState() => _NewWorkoutPageState();
}

class _NewWorkoutPageState extends State<NewWorkoutPage> {
  final TextEditingController _controller = TextEditingController();
  final _myBox = Hive.box('database');
  DataBase db = DataBase();

  void addWorkout() {
    if (_myBox.get('WORKOUTNAMES') != null) {
      db.loadWorkoutNames();
    }
    if (_controller.text != '') {
      List workoutNamesCopy = List.from(db.workoutNames);
      workoutNamesCopy.add([_controller.text]);
      _myBox.put('WORKOUTNAMES', workoutNamesCopy);
      Navigator.pushNamed(context, '/home_page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: black,
        title: Text(
          'Add new workout',
          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                Text(
                  'Name',
                  style: GoogleFonts.inter(color: white, fontSize: 18),
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height / 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: inactiveGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: TextField(
                        style: GoogleFonts.inter(
                          color: white,
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 10),
                Center(child: Image.asset('assets/4.png', scale: 1.8))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                alignment: const Alignment(1, 1),
                child: CustomAddButton(
                  bgColor: purple,
                  fontColor: white,
                  text: 'Save',
                  onTap: () {
                    addWorkout();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
