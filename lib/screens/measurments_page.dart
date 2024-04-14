import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:workout_log/consts/colors.dart';
import 'package:workout_log/data/measurments_provider.dart';
import '../data/data_base.dart';
import '../widgets/measurments_data_tile.dart';

class MeasurmentsPage extends StatefulWidget {
  const MeasurmentsPage({super.key});

  @override
  State<MeasurmentsPage> createState() => _MeasurmentsPageState();
}

class _MeasurmentsPageState extends State<MeasurmentsPage> {
  final _myBox = Hive.box('database');
  DataBase db = DataBase();

  @override
  void initState() {
    int index = context.read<MeasurmentsProvider>().index;
    String data = context.read<MeasurmentsProvider>().data;

    if (_myBox.get('MEASURMENTSLIST') == null) {
      db.createInitalData();
    } else {
      db.loadData();
    }
    if (index != -1) {
      db.measurmentsList[index][1] = data;
      db.updateDataBase();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'General',
                    style: GoogleFonts.inter(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height / 4) - 40,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: MeasurmentsDataTile(
                            index: index,
                            title: db.measurmentsList[index][0].toString(),
                            data: db.measurmentsList[index][1].toString(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Body measurments',
                  style: GoogleFonts.inter(
                      color: white, fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.7,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 11,
                    itemBuilder: (context, index) {
                      index += 2;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: MeasurmentsDataTile(
                          index: index,
                          title: db.measurmentsList[index][0].toString(),
                          data: db.measurmentsList[index][1].toString(),
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
