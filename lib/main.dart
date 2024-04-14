import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:workout_log/screens/diares_page.dart';
import 'package:workout_log/screens/intro_page.dart';
import 'package:workout_log/screens/measurments_page.dart';
import 'package:workout_log/screens/new_workout_page.dart';
import 'package:workout_log/widgets/hidden_drawer.dart';
import 'data/measurments_provider.dart';
import 'data/sets_provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('database');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MeasurmentsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SetsProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        routes: {
          '/home_page': (context) => const HiddenDrawer(),
          '/measurmets_page': (context) => const MeasurmentsPage(),
          '/new_workout_page': (context) => const NewWorkoutPage(),
          '/diares_page': (context) => const DiaresPage(),
        },
      ),
    );
  }
}
