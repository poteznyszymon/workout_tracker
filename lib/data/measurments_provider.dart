import 'package:flutter/material.dart';

class MeasurmentsProvider extends ChangeNotifier {
  int index;
  String data;

  MeasurmentsProvider({this.index = -1, this.data = ''});

  void setIndex({required int newIndex}) async {
    index = newIndex;
    notifyListeners();
  }

  void setData({required String newData}) async {
    data = newData;
    notifyListeners();
  }
}
