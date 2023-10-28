import 'package:calculater/controllers/calculator_controller.dart';
import 'package:calculater/widgets/delete_button.dart';
import 'package:calculater/widgets/equal_button.dart';
import 'package:calculater/widgets/mince_button.dart';
import 'package:calculater/widgets/numbers.dart';
import 'package:calculater/widgets/plus_button.dart';
import 'package:calculater/widgets/signs_button.dart';
import 'package:calculater/widgets/zero_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalculatorController>(
      init: CalculatorController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(-0.20, -0.98),
                end: const Alignment(0.2, 0.98),
                colors: [controller.backGround, controller.backGroundTwo],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.dark_mode,
                          size: 35,
                          color: Color(0xFF0F9DFF),
                        ),
                        onPressed: () {
                          controller.changeTheme();
                        },
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                        Text(
                        "Calculator",
                        style: TextStyle(
                            color:  controller.titleColor,
                            fontSize: 35,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      alignment: Alignment.centerRight,
                      height: 100,
                      child: Text(
                        controller.operation,
                        style: const TextStyle(
                          color: Color(0xFF808080),
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      alignment: Alignment.centerRight,
                      height: 100,
                      child: Text(
                        "= ${controller.output}",
                        style: TextStyle(
                          color: controller.outputColor,
                          fontSize: controller.fontSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Stack(children: [
                    SizedBox(
                      height: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              DeleteButton(index: 0),
                              SizedBox(
                                height: 15,
                              ),
                              NumberButton(index: 4),
                              SizedBox(
                                height: 15,
                              ),
                              NumberButton(index: 8),
                              SizedBox(
                                height: 15,
                              ),
                              NumberButton(index: 12),
                            ],
                          ),
                          Column(
                            children: [
                              DeleteButton(index: 1),
                              SizedBox(
                                height: 15,
                              ),
                              NumberButton(index: 5),
                              SizedBox(
                                height: 15,
                              ),
                              NumberButton(index: 9),
                              SizedBox(
                                height: 15,
                              ),
                              NumberButton(index: 13),
                            ],
                          ),
                          Column(
                            children: [
                              SignButton(index: 2),
                              SizedBox(
                                height: 15,
                              ),
                              NumberButton(index: 6),
                              SizedBox(
                                height: 15,
                              ),
                              NumberButton(index: 10),
                              SizedBox(
                                height: 15,
                              ),
                              NumberButton(index: 14),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SignButton(index: 3),
                              SizedBox(
                                height: 15,
                              ),
                              MinceButton(index: 7),
                              SizedBox(
                                height: 15,
                              ),
                              PlusButton(index: 11),
                              SizedBox(
                                height: 15,
                              ),
                              EqualButton(index: 17),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 365,
                      width: 320,
                      child: Row(
                         
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ZeroButton(index: 15),Spacer(flex: 1,),
                         
                          NumberButton(index: 16),
                          Spacer(flex: 1,),
                        
                        ],
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
