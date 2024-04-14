import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:workout_log/widgets/custom_add_button.dart';

import '../consts/colors.dart';
import '../data/data_base.dart';
import '../data/sets_provider.dart';
import '../widgets/add_set_widget.dart';

class SetsPage extends StatefulWidget {
  final String name;
  const SetsPage({
    super.key,
    required this.name,
  });

  @override
  State<SetsPage> createState() => _SetsPageState();
}

class _SetsPageState extends State<SetsPage> {
  var tileFontStyle = GoogleFonts.inter(
      color: white, fontSize: 16, fontWeight: FontWeight.w600);
  final _myBox = Hive.box('database');
  DataBase db = DataBase();

  @override
  void initState() {
    if (_myBox.get(widget.name) == null) {
      db.createInitialSets();
    } else {
      db.loadSetsData(widget.name);
    }
    super.initState();
  }

  void addSet() {
    setState(() {
      List setsListCopy = List.from(db.setsList);
      setsListCopy.insert(0, [
        context.read<SetsProvider>().reps.toString(),
        context.read<SetsProvider>().weight.toString(),
        "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}"
      ]);
      _myBox.put(widget.name, setsListCopy);
      db.loadSetsData(widget.name);
    });
  }

  bool checkSetPadding(int index) {
    if (index < db.setsList.length - 1) {
      if (db.setsList[index][2] != db.setsList[index + 1][2]) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  bool canDelete(int index) {
    if (db.setsList[index][2] ==
        "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}") {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        title: Text(
          widget.name,
          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AddSetWidget(
                  isReps: true,
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 20),
                const AddSetWidget(
                  isReps: false,
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomAddButton(
              bgColor: purple,
              fontColor: white,
              onTap: () {
                addSet();
              },
              text: 'Add set',
            ),
            const SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height / 30,
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width / 10),
                  Text(
                    'Reps',
                    style: tileFontStyle,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 8),
                  Text(
                    'Weight',
                    style: tileFontStyle,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 6),
                  Text(
                    'Date',
                    style: tileFontStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 1.9) -
                  MediaQuery.of(context).size.height / 30,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: db.setsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: (checkSetPadding(index))
                        ? const EdgeInsets.only(bottom: 30)
                        : const EdgeInsets.only(bottom: 10),
                    child: Slidable(
                      enabled: canDelete(index),
                      endActionPane: ActionPane(
                        extentRatio: 0.2,
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
                                  setState(
                                    () {
                                      db.setsList.removeAt(index);
                                      db.updateSetsData(widget.name);
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
                      child: Container(
                        decoration: BoxDecoration(
                            color: tileGrey,
                            borderRadius: BorderRadius.circular(8)),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(db.setsList[index][0], style: tileFontStyle),
                            Text(
                              db.setsList[index][1],
                              style: tileFontStyle,
                            ),
                            Text(
                              db.setsList[index][2],
                              style: tileFontStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
