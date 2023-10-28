import 'package:calculater/constants/numbers_inputs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  String operation = "0";
  double fontSize = 35;
  List<String> inputs = ["0"];
  String output = "0";
  bool isLight = true;
  List<Color> numberColorlist = [
    Colors.white.withOpacity(0.6000000238418579),
    Colors.white.withOpacity(0.4000000059604645)
  ];
  Color titleColor = const Color(0xFF1991FF);
  Color outputColor = const Color(0xFF424242);
  Color equalContainerColor = const Color(0xFF18ACFF);

  Color equalTextColor = const Color(0xFFB2DAFF);
  Color plusContainerColor = const Color(0xFFADE1FF);

  Color plusTextColor = const Color(0xFF0F9DFF);
  Color signsContainerColor = const Color(0xFFADE1FF);

  Color signsTextColor = const Color(0xFF0F9DFF);
  Color minceContainerColor = const Color(0xFFADE1FF);

  Color minceTextColor = const Color(0xFF0F9DFF);

  Color deleteContainerColor = Colors.white;

  Color deleteContainerBorderSideColor = Colors.white;
  Color deleteTextColor = const Color(0xFF848484);
  Color backGround = const Color(0xFFF6F7FA);
  Color backGroundTwo = const Color(0xFFF6F7FA);
  void changeTheme() {
    if (isLight) {
      numberColorlist = [Colors.black, Colors.black];
      backGround = const Color(0xFF17181A);
      backGroundTwo = const Color(0xFF17181A);

      deleteContainerColor = const Color(0xFF606060);

      deleteContainerBorderSideColor = Colors.white;
      deleteTextColor = const Color(0xFFA4A4A4);
//delete
      equalContainerColor = const Color(0xFF1991FF);

      equalTextColor = const Color(0xFFB2DAFF);
      //equal
      minceContainerColor = const Color(0xFF005DB2);
      minceTextColor = const Color(0xFF0F9DFF);
      //mince
      plusContainerColor = const Color(0xFF005DB2);
      plusTextColor = const Color(0xFF329DFF);
      //plus
      signsContainerColor = const Color(0xFF005DB2);

      signsTextColor = const Color(0xFF0F9DFF);
      // signs
      outputColor = Colors.white;
      //output
      titleColor = Colors.white;
      isLight = false;
      update();
    } else {
      numberColorlist = [
        Colors.white.withOpacity(0.6000000238418579),
        Colors.white.withOpacity(0.4000000059604645)
      ];
      backGround = const Color(0xFFF6F7FA);
      backGroundTwo = const Color(0xFFF6F7FA);
      deleteContainerColor = Colors.white;

      deleteContainerBorderSideColor = Colors.white;
      deleteTextColor = const Color(0xFF848484);
      //delete
      equalContainerColor = const Color(0xFF18ACFF);

      equalTextColor = const Color(0xFFB2DAFF);

      //equal
      minceContainerColor = const Color(0xFFADE1FF);

      minceTextColor = const Color(0xFF0F9DFF);
      //mince
      plusContainerColor = const Color(0xFFADE1FF);

      plusTextColor = const Color(0xFF329DFF);
      //plus
      signsContainerColor = const Color(0xFFADE1FF);

      signsTextColor = const Color(0xFF0F9DFF);
      //signs
      outputColor = const Color(0xFF424242);
      //output
      titleColor = const Color(0xFF1991FF);
      //titleColor
      isLight = true;
      update();
    }
  }

  void calculate(int index) {
    if (Inputs.input[index] == 'AC') {
      fontSize = 35;
      clear();
      update();
    } else if (Inputs.input[index] == 'X') {
      if (operation.length > 1) {
        operation = operation.substring(0, operation.length - 1);
        fontSize = 35;
        update();
      } else {
        operation = "0";
        fontSize = 35;
        update();
      }
      update();
    } else if (Inputs.input[index] == "+" && operation == "0" ||
        Inputs.input[index] == "/" && operation == "0" ||
        Inputs.input[index] == "*" && operation == "0" ||
        Inputs.input[index] == "+/-" && operation == "0" ||
        Inputs.input[index] == "%" && operation == "0") {
    } else if ((Inputs.input[index] == '%' ||
            Inputs.input[index] == '/' ||
            Inputs.input[index] == '.' ||
            Inputs.input[index] == '*' ||
            Inputs.input[index] == '+' ||
            Inputs.input[index] == '-') &&
        (operation.endsWith("%") ||
            operation.endsWith("*") ||
            operation.endsWith(".") ||
            operation.endsWith("/") ||
            operation.endsWith("+") ||
            operation.endsWith("-"))) {
      update();
      if (operation.endsWith("%") ||
          operation.endsWith("*") ||
          operation.endsWith(".") ||
          operation.endsWith("/") ||
          operation.endsWith("+") ||
          operation.endsWith("-")) {
        fontSize = 35;
        update();
      } else {
        update();
        operation += Inputs.input[index];
        update();
        if (operation.endsWith("*") ||
            operation.endsWith("/") ||
            operation.endsWith("+") ||
            operation.endsWith("-")) {
          fontSize = 35;
          update();
          //
        } else {
          fontSize = 35;
          Parser p = Parser();
          Expression exp = p.parse(operation);
          double eval = exp.evaluate(EvaluationType.REAL, ContextModel());

          output = eval.toString();
          update();
        }
      }
    } else if (Inputs.input[index] == '=') {
      if (operation.endsWith("%") ||
          operation.endsWith("*") ||
          operation.endsWith(".") ||
          operation.endsWith("/") ||
          operation.endsWith("+") ||
          operation.endsWith("-")) {
      } else {
        Parser p = Parser();
        Expression exp = p.parse(operation);
        double eval = exp.evaluate(EvaluationType.REAL, ContextModel());

        output = eval.toString();
        fontSize = 48;
        update();
      }
    } else {
      if (operation == "0") {
        operation = "";
        fontSize = 35;
        update();
      }
      fontSize = 35;
      operation += Inputs.input[index];
      update();
    }
    update();
  }

  void clear() {
    fontSize = 35;
    operation = "0";
    output = "0";
    update();
    if (inputs.isNotEmpty) {
      inputs.clear();
      update();
    }
    update();
  }

  // BoxShadow updateBoxShadows(String s) {
  //   if (s == "=") {
  //     return const BoxShadow(
  //       color: Color(0xA500A3FF),
  //       blurRadius: 23,
  //       offset: Offset(-9, 13),
  //       spreadRadius: 0,
  //     );
  //   } else {
  //     return const BoxShadow(color: Colors.transparent);
  //   }
  // }
  // LinearGradient updatelinearGradient(
  //   String s,
  // ) {
  //   updateContainerColor(s);
  //   if (s == "=" || s == "+") {
  //     return const LinearGradient(
  //         begin: Alignment.bottomCenter,
  //         end: Alignment.topCenter,
  //         colors: [Color(0xFFADE1FF), Color(0xFFADE1FF)]);
  //   } else {
  //     LinearGradient linearGradient = LinearGradient(
  //       begin: const Alignment(0.77, -0.64),
  //       end: const Alignment(-0.77, 0.64),
  //       colors: [
  //         Colors.white.withOpacity(0.6000000238418579),
  //         Colors.white.withOpacity(0.4000000059604645)
  //       ],
  //     );
  //     return linearGradient;
  //   }
  // }

  // Color updateContainerColor(String s) {
  //   if (s == '/' || s == '*' || s == 'C' || s == '-' || s == '+' || s == '%') {
  //     return const Color(0xFFADE1FF);
  //   } else {
  //     return Colors.white;
  //   }
  // }

  // Color updateTextColor(String text) {
  //   if (text == 'AC' || text == 'DEl') {
  //     return const Color(0xFF848484);
  //   } else {
  //     return const Color(0xFF38B9FF);
  //   }
  // }
}
 