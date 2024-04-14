import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:workout_log/consts/colors.dart';
import '../data/data_base.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/diares_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _myBox = Hive.box('database');
  DataBase db = DataBase();
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    if (_myBox.get('NAME') == null) {
      db.createInitalName();
    } else {
      db.loadNameData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Stack(
          alignment: const Alignment(0, -0.2),
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Container(
                  width: MediaQuery.of(context).size.height / 6,
                  height: MediaQuery.of(context).size.height / 6,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: purple),
                  child: Center(
                    child: Text(
                      db.name[0],
                      style: GoogleFonts.inter(
                        color: white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                Text(
                  db.name,
                  style: GoogleFonts.inter(
                    color: white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const DiaresTile(),
            const CustomBackButton(),
            Container(
              alignment: const Alignment(0.3, -0.6),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  shape: const CircleBorder(
                    side: BorderSide(color: purple, width: 2),
                  ),
                  backgroundColor: Colors.white,
                ),
                onPressed: () => {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.transparent,
                      content: Container(
                        decoration: BoxDecoration(
                          color: tileGrey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: MediaQuery.of(context).size.height / 5,
                        width: 600,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Update username',
                                style: GoogleFonts.inter(
                                    color: white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                  border: Border.all(color: white),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextField(
                                    controller: _controller,
                                    style: GoogleFonts.inter(
                                      color: white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      hintText: 'Name',
                                      hintStyle: GoogleFonts.inter(
                                        color: white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        color: Colors.red[300],
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      db.name = _controller.text;
                                      db.updateNameData();
                                      setState(() {});
                                      _controller.clear();
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Save',
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        color: purple,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                },
                child: const Icon(
                  Icons.mode_edit_outlined,
                  color: purple,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
