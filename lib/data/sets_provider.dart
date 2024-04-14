import 'package:flutter/material.dart';

class SetsProvider extends ChangeNotifier {
  int reps;
  int weight;

  SetsProvider({this.reps = 5, this.weight = 30});

  void setReps({required int newReps}) async {
    reps = newReps;
    notifyListeners();
  }

  void setWeight({required int newWeight}) async {
    weight = newWeight;
    notifyListeners();
  }
}
