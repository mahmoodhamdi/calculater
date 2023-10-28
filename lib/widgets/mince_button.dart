import 'package:calculater/constants/numbers_inputs.dart';
import 'package:calculater/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MinceButton extends StatelessWidget {
  const MinceButton({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CalculatorController>(
        builder: (controller) => GestureDetector(
              onTap: () {
                controller.calculate(index);
              },
              child: Container(
                width: 62,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                decoration: ShapeDecoration(
                  color: controller.minceContainerColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                    child: Text(
                  Inputs.input[index],
                  style: TextStyle(
                    color: controller.minceTextColor,
                    fontSize: 35,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    height: 0,
                  ),
                )),
              ),
            ));
  }
}
