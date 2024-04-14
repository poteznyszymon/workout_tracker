import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:workout_log/consts/colors.dart';
import 'package:workout_log/screens/add_exercise_page.dart';
import 'package:workout_log/screens/sets_page.dart';
import 'package:workout_log/widgets/custom_add_button.dart';
import 'package:workout_log/widgets/workout_tile.dart';

import '../data/data_base.dart';

class ExercisesPage extends StatefulWidget {
  final String name;
  const ExercisesPage({
    super.key,
    required this.name,
  });

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  final _myBox = Hive.box('database');
  DataBase db = DataBase();

  @override
  void initState() {
    if (_myBox.get(widget.name) == null) {
      db.createInitialExercise();
    } else {
      db.loadExerciseNames(widget.name);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        title: Text(
          widget.name,
          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home_page');
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: db.exercisesList.length,
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                    extentRatio: 0.3,
                    motion: const StretchMotion(),
                    children: [
                      Expanded(
                        child: Container(
                          height:
                              ((MediaQuery.of(context).size.height / 4) - 70) /
                                  2,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: SlidableAction(
                            onPressed: (context) => {
                              setState(
                                () {
                                  db.exercisesList.removeAt(index);
                                  db.updateExerciseNames(widget.name);
                                },
                              )
                            },
                            icon: Icons.delete,
                            backgroundColor: Colors.red.shade400,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      )
                    ],
                  ),
                  child: WorkoutTile(
                    name: db.exercisesList[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetsPage(
                            name: db.exercisesList[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Container(
              alignment: const Alignment(1, 1),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: CustomAddButton(
                  bgColor: purple,
                  fontColor: white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddExercisePage(
                          name: widget.name,
                        ),
                      ),
                    );
                  },
                  text: 'Add exercise',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
