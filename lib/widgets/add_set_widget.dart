import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workout_log/consts/colors.dart';

import '../data/sets_provider.dart';

class AddSetWidget extends StatefulWidget {
  final bool isReps;
  const AddSetWidget({
    super.key,
    required this.isReps,
  });

  @override
  State<AddSetWidget> createState() => _AddSetWidgetState();
}

class _AddSetWidgetState extends State<AddSetWidget> {
  final TextEditingController _repsController =
      TextEditingController(text: '5');
  final TextEditingController _weightController =
      TextEditingController(text: '30');

  void increaseReps() {
    setState(() {
      int reps = int.parse(_repsController.text);
      reps += 1;
      _repsController.text = reps.toString();
      context.read<SetsProvider>().setReps(newReps: reps);
    });
  }

  void decreaseReps() {
    setState(() {
      int reps = int.parse(_repsController.text);
      if (reps >= 1) {
        reps -= 1;
        _repsController.text = reps.toString();
        context.read<SetsProvider>().setReps(newReps: reps);
      }
    });
  }

  void increaseWeight() {
    setState(() {
      int weight = int.parse(_weightController.text);
      weight += 5;
      _weightController.text = weight.toString();
      context.read<SetsProvider>().setWeight(newWeight: weight);
    });
  }

  void decreaseWeight() {
    setState(() {
      int weight = int.parse(_weightController.text);
      if (weight - 5 >= 0) {
        weight -= 5;
        _weightController.text = weight.toString();
        context.read<SetsProvider>().setWeight(newWeight: weight);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          color: tileGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.isReps ? 'Reps' : 'Weight',
              style: GoogleFonts.inter(
                  color: white, fontSize: 14, fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: widget.isReps
                  ? () {
                      increaseReps();
                    }
                  : () {
                      increaseWeight();
                    },
              child: const Icon(
                Icons.keyboard_arrow_up,
                color: purple,
                size: 30,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 8,
              width: MediaQuery.of(context).size.width / 8,
              child: TextField(
                maxLength: 2,
                controller: widget.isReps ? _repsController : _weightController,
                textAlign: TextAlign.center,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: "",
                ),
                style: GoogleFonts.inter(
                    color: white, fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            GestureDetector(
              onTap: widget.isReps
                  ? () {
                      decreaseReps();
                    }
                  : () {
                      decreaseWeight();
                    },
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: purple,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
