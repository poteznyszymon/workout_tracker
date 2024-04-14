import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:workout_log/screens/exercises_page.dart';

import '../consts/colors.dart';
import '../data/data_base.dart';
import '../widgets/custom_add_button.dart';

class AddExercisePage extends StatefulWidget {
  final String name;
  const AddExercisePage({super.key, required this.name});

  @override
  State<AddExercisePage> createState() => _AddExercisePageState();
}

class _AddExercisePageState extends State<AddExercisePage> {
  final TextEditingController _controller = TextEditingController();

  final _myBox = Hive.box('database');
  DataBase db = DataBase();

  void addWorkout() {
    if (_myBox.get(widget.name) != null) {
      db.loadExerciseNames(widget.name);
    }
    if (_controller.text != '') {
      List<String> exercisesCopy = List.from(db.exercisesList);
      exercisesCopy.add(_controller.text);
      _myBox.put(widget.name, exercisesCopy);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExercisesPage(
            name: widget.name,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        title: Text(
          'Add new exercise',
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
                Center(
                    child: Image.asset(
                  'assets/5.png',
                  scale: 0.5,
                ))
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
