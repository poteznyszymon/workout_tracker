import 'package:hive_flutter/adapters.dart';

class DataBase {
  List measurmentsList = [];
  List workoutNames = [];
  List exercisesList = [];
  List setsList = [];

  final _myBox = Hive.box('database');
  late String name;

  void createInitalName() {
    name = 'Deafult name';
  }

  void createInitalData() {
    measurmentsList = [
      ['Weight', '0'],
      ['Fat percentage', '0'],
      ['Weight', '0'],
      ['Neck', '0'],
      ['Chest', '0'],
      ['Shoulder girth', '0'],
      ['Right arm', '0'],
      ['Left arm', '0'],
      ['Waist', '0'],
      ['Right tight', '0'],
      ['Left tight', '0'],
      ['Right calf', '0'],
      ['Left calf', '0'],
    ];
  }

  void createInitialWorkouts() {
    workoutNames = [
      ['Push'],
      ['Pull'],
      ['Legs'],
    ];
  }

  void createInitialExercise() {
    exercisesList = [];
  }

  void createInitialSets() {
    setsList = [
      ['12', '30', '13.4.2024'],
      ['10', '40', '13.4.2024'],
      ['8', '50', '13.4.2024'],
    ];
  }

  void loadData() {
    measurmentsList = _myBox.get('MEASURMENTSLIST');
  }

  void updateDataBase() {
    _myBox.put('MEASURMENTSLIST', measurmentsList);
  }

  void loadNameData() {
    name = _myBox.get('NAME');
  }

  void updateNameData() {
    _myBox.put('NAME', name);
  }

  void loadWorkoutNames() {
    workoutNames = _myBox.get('WORKOUTNAMES');
  }

  void updateWorkoutNames() {
    _myBox.put('WORKOUTNAMES', workoutNames);
  }

  void loadExerciseNames(String exerciseName) {
    exercisesList = _myBox.get(exerciseName);
  }

  void updateExerciseNames(String exerciseName) {
    _myBox.put(exerciseName, exercisesList);
  }

  void loadSetsData(String setName) {
    setsList = _myBox.get(setName);
  }

  void updateSetsData(String setName) {
    setsList = _myBox.get(setName);
  }
}
