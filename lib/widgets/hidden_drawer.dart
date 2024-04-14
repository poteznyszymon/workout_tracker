import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:workout_log/consts/colors.dart';
import 'package:workout_log/screens/home_page.dart';
import 'package:workout_log/screens/measurments_page.dart';
import 'package:workout_log/screens/profile_page.dart';
import 'package:workout_log/screens/settings_page.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  final inactiveTextStyle = GoogleFonts.inter(
      fontSize: 18, color: inactiveGrey, fontWeight: FontWeight.w700);

  final activeTextStyle = GoogleFonts.inter(
      fontSize: 18, color: white, fontWeight: FontWeight.w700);

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            colorLineSelected: Colors.transparent,
            name: 'Home',
            baseStyle: inactiveTextStyle,
            selectedStyle: activeTextStyle),
        const HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: Colors.transparent,
          name: 'Profile',
          baseStyle: inactiveTextStyle,
          selectedStyle: activeTextStyle,
        ),
        const ProfilePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: Colors.transparent,
          name: 'Measurments',
          baseStyle: inactiveTextStyle,
          selectedStyle: activeTextStyle,
        ),
        const MeasurmentsPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: Colors.transparent,
          name: 'Settings',
          baseStyle: inactiveTextStyle,
          selectedStyle: activeTextStyle,
        ),
        const SettingsPage(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      enableShadowItensMenu: false,
      styleAutoTittleName: GoogleFonts.inter(fontWeight: FontWeight.w500),
      backgroundColorAppBar: black,
      backgroundColorMenu: purple,
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 45,
      verticalScalePercent: 95,
    );
  }
}
