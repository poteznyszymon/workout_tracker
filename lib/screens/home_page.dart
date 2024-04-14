import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:workout_log/consts/colors.dart';
import 'package:workout_log/screens/exercises_page.dart';
import '../data/data_base.dart';
import '../widgets/custom_add_button.dart';
import '../widgets/workout_tile.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('database');
  DataBase db = DataBase();

  @override
  void initState() {
    if (_myBox.get('WORKOUTNAMES') == null) {
      db.createInitialWorkouts();
    } else {
      db.loadWorkoutNames();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3.23,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: db.workoutNames.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.3,
                          motion: const StretchMotion(),
                          children: [
                            Expanded(
                              child: Container(
                                height:
                                    ((MediaQuery.of(context).size.height / 4) -
                                            70) /
                                        2,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: SlidableAction(
                                  onPressed: (context) => {
                                    setState(() {
                                      db.workoutNames.removeAt(index);
                                      db.updateWorkoutNames();
                                    })
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
                          name: db.workoutNames[index][0].toString(),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExercisesPage(
                                  name: db.workoutNames[index][0].toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2.16,
                  width: MediaQuery.of(context).size.width,
                  //color: tileGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularPercentIndicator(
                            radius: 150,
                            percent: 0.8,
                            backgroundColor: black,
                            progressColor: purple,
                          ),
                          Column(
                            children: [
                              const Icon(
                                Icons.directions_walk_rounded,
                                color: purple,
                                size: 35,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Steps',
                                style: GoogleFonts.inter(
                                  color: inactiveGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '7999',
                                style: GoogleFonts.inter(
                                  color: white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                      Text(
                        'Goal : 10 000',
                        style: GoogleFonts.inter(
                          color: inactiveGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: const Alignment(0, 1),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: CustomAddButton(
                  bgColor: purple,
                  fontColor: white,
                  text: 'Add workout',
                  onTap: () {
                    Navigator.pushNamed(context, '/new_workout_page');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
