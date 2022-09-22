import 'package:flutter/material.dart';
import 'package:flutter_calculator/components/calculatorButton.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String previousOperand = '';
  String currentOperator = '';
  String currentOperand = '';

  void addOperator(operator) {
    if (currentOperand.isEmpty) return;
    if (currentOperator.isNotEmpty) {
      performCalculation();
    }

    setState(() {
      previousOperand = currentOperand;
      currentOperator = operator;
      currentOperand = '';
    });
  }

  void performCalculation() {
    double leftOperand = checkForPercentageInOperand(currentOperand);
    double rightOperand = checkForPercentageInOperand(previousOperand);

    double result = 0;

    switch (currentOperator) {
      case '+':
        result = leftOperand + rightOperand;
        break;
      case '-':
        result = leftOperand - rightOperand;
        break;
      case 'x':
        result = leftOperand * rightOperand;
        break;
      case '/':
        result = leftOperand / rightOperand;
        break;
    }

    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

    setState(() {
      previousOperand = '';
      currentOperator = '';
      currentOperand = result.toString().replaceAll(regex, '');
    });
  }

  double checkForPercentageInOperand(operand) {
    if (operand.contains('%')) {
      double result = 1;
      var numberBeforePercentageOperator =
          operand.substring(0, operand.indexOf('%'));
      result = double.parse(numberBeforePercentageOperator) * 0.01;
      if (operand.length > operand.indexOf('%') + 1) {
        result *= double.parse(operand.substring(operand.indexOf('%') + 1));
      }

      return result;
    }
    return double.parse(operand);
  }

  void negate() {
    if (currentOperand.isNotEmpty) {
      double currentOperandNum = double.parse(currentOperand);
      currentOperandNum *= -1;
      setState(() {
        currentOperand = currentOperandNum.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '$previousOperand $currentOperator',
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.amberAccent,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      currentOperand,
                      style: const TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                      ),
                    )
                  ]),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalculatorButton(
                          type: 'delete',
                          value: 'AC',
                          func: () {
                            setState(() {
                              currentOperand =
                                  previousOperand = currentOperator = '';
                            });
                          }),
                      CalculatorButton(
                        type: 'digit',
                        value: '+/-',
                        func: negate,
                      ),
                      CalculatorButton(
                          type: 'digit',
                          value: '%',
                          func: () {
                            setState(() {
                              currentOperand += (currentOperand.contains('%') ||
                                      currentOperand.isEmpty)
                                  ? ''
                                  : '%';
                            });
                          }),
                      CalculatorButton(
                        type: 'arithmeticOperator',
                        value: '/',
                        func: () {
                          addOperator('/');
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalculatorButton(
                          type: 'digit',
                          value: '7',
                          func: () {
                            setState(() {
                              currentOperand += '7';
                            });
                          }),
                      CalculatorButton(
                          type: 'digit',
                          value: '8',
                          func: () {
                            setState(() {
                              currentOperand += '8';
                            });
                          }),
                      CalculatorButton(
                          type: 'digit',
                          value: '9',
                          func: () {
                            setState(() {
                              currentOperand += '9';
                            });
                          }),
                      CalculatorButton(
                          type: 'arithmeticOperator',
                          value: 'x',
                          func: () {
                            addOperator('x');
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalculatorButton(
                          type: 'digit',
                          value: '4',
                          func: () {
                            setState(() {
                              currentOperand += '4';
                            });
                          }),
                      CalculatorButton(
                          type: 'digit',
                          value: '5',
                          func: () {
                            setState(() {
                              currentOperand += '5';
                            });
                          }),
                      CalculatorButton(
                          type: 'digit',
                          value: '6',
                          func: () {
                            setState(() {
                              currentOperand += '6';
                            });
                          }),
                      CalculatorButton(
                          type: 'arithmeticOperator',
                          value: '-',
                          func: () {
                            addOperator('-');
                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalculatorButton(
                          type: 'digit',
                          value: '1',
                          func: () {
                            setState(() {
                              currentOperand += '1';
                            });
                          }),
                      CalculatorButton(
                          type: 'digit',
                          value: '2',
                          func: () {
                            setState(() {
                              currentOperand += '2';
                            });
                          }),
                      CalculatorButton(
                          type: 'digit',
                          value: '3',
                          func: () {
                            setState(() {
                              currentOperand += '3';
                            });
                          }),
                      CalculatorButton(
                          type: 'arithmeticOperator',
                          value: '+',
                          func: () {
                            addOperator('+');
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalculatorButton(
                          type: 'digit',
                          value: '0',
                          func: () {
                            setState(() {
                              currentOperand += '0';
                            });
                          }),
                      CalculatorButton(
                          type: 'digit',
                          value: '.',
                          func: () {
                            setState(() {
                              currentOperand += (currentOperand.isEmpty ||
                                      currentOperand.contains('.'))
                                  ? ''
                                  : '.';
                            });
                          }),
                      const SizedBox(width: 45, height: 45),
                      CalculatorButton(
                          type: 'calculationOperator',
                          value: '=',
                          func: () {
                            performCalculation();
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
