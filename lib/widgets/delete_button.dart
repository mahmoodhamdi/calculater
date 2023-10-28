import 'package:calculater/constants/numbers_inputs.dart';
import 'package:calculater/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalculatorController>(
      builder: (controller) => GestureDetector(
        onLongPress: () {
          controller.clear();
        },
        onTap: () {
          controller.calculate(index);
        },
        child: Container(
          width: 62,
          height: 62,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          decoration: ShapeDecoration(
            color: controller.deleteContainerColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1, color: controller.deleteContainerBorderSideColor),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Center(
              child: Text(
            Inputs.input[index],
            style: TextStyle(
              color: controller.deleteTextColor,
              fontSize: 32,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              height: 0,
            ),
          )),
        ),
      ),
    );
  }
}
 