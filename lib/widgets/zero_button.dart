import 'package:calculater/constants/numbers_inputs.dart';
import 'package:calculater/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ZeroButton extends StatelessWidget {
  const ZeroButton({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalculatorController>(
        builder: (controller) => GestureDetector(
            onTap: () {
              controller.calculate(index);
            },
            child: Container(
              width: 160,
              height: 60,
               padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                    begin: const Alignment(0.77, -0.64),
                    end: const Alignment(-0.77, 0.64),
                    colors: controller.numberColorlist),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Center(
                  child: Text(
                Inputs.input[index],
                style: const TextStyle(
                  color: Color(0xFF0F9DFF),
                  fontSize: 32,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              )),
            )));
  }
}
