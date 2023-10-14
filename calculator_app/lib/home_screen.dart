import 'package:calculator_app/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        answer.toString(),
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'mc',
                          onpress: () {},
                        ),
                        MyButton(title: 'm+', onpress: () {}),
                        MyButton(title: 'm-', onpress: () {}),
                        MyButton(title: 'mr', onpress: () {}),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          onpress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                        MyButton(
                            title: '+/-',
                            color: const Color(0xffffa00a),
                            onpress: () {
                              userInput += '+/-';
                              setState(() {});
                            }),
                        MyButton(
                            title: '%',
                            color: const Color(0xffffa00a),
                            onpress: () {
                              userInput += '%';
                              setState(() {});
                            }),
                        MyButton(
                            title: '/',
                            color: const Color(0xffffa00a),
                            onpress: () {
                              userInput += '/';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          onpress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '8',
                            onpress: () {
                              userInput += '8';
                              setState(() {});
                            }),
                        MyButton(
                            title: '9',
                            onpress: () {
                              userInput += '9';
                              setState(() {});
                            }),
                        MyButton(
                            title: 'x',
                            color: const Color(0xffffa00a),
                            onpress: () {
                              userInput += 'x';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          onpress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '5',
                            onpress: () {
                              userInput += '5';
                              setState(() {});
                            }),
                        MyButton(
                            title: '6',
                            onpress: () {
                              userInput += '6';
                              setState(() {});
                            }),
                        MyButton(
                            title: '-',
                            color: const Color(0xffffa00a),
                            onpress: () {
                              userInput += '-';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          onpress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '2',
                            onpress: () {
                              userInput += '2';
                              setState(() {});
                            }),
                        MyButton(
                            title: '3',
                            onpress: () {
                              userInput += '3';
                              setState(() {});
                            }),
                        MyButton(
                            title: '+',
                            color: const Color(0xffffa00a),
                            onpress: () {
                              userInput += '+';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '.',
                          onpress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '0',
                            onpress: () {
                              userInput += '0';
                              setState(() {});
                            }),
                        MyButton(
                            title: 'Del',
                            onpress: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);

                              setState(() {});
                            }),
                        MyButton(
                            title: '=',
                            color: const Color(0xffffa00a),
                            onpress: () {
                              equalPress();
                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
