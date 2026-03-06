import 'package:flutter/material.dart';
import 'package:mortease/pages/inputWidget.dart';
import 'package:mortease/pages/input_button_widget.dart';
import 'dart:math';

import 'package:mortease/pages/result_section.dart';

class Morteasehomepage extends StatefulWidget {
  const Morteasehomepage({super.key});

  @override
  State<Morteasehomepage> createState() => _MorteasehomepageState();
}

class _MorteasehomepageState extends State<Morteasehomepage> {
  final TextEditingController mortgageAmount = TextEditingController();
  final TextEditingController mortgageTerm = TextEditingController();
  final TextEditingController interestRate = TextEditingController();

  //!  varibales for this
  double ma = 0.0;
  double mt = 0.0;
  double mr = 0.0;
  double totalRepayments = 0;
  double result = 0.0;
  bool isCalc = false;

  void calcMortgage() {
    if (formKey.currentState!.validate()) {
      setState(() {
        ma = double.tryParse(mortgageAmount.text) ?? 0.0;
        mt = double.tryParse(mortgageTerm.text) ?? 0.0;
        mr = double.tryParse(interestRate.text) ?? 0.0;

        double yearsInTomonth = (mt * 12);
        double irateMonthly = (mr / 100) / 12;

        double monthlyRepaymant = ma *
            (irateMonthly * pow(1 + irateMonthly, yearsInTomonth)) /
            (pow(1 + irateMonthly, yearsInTomonth) - 1);

        result = monthlyRepaymant;
        totalRepayments = result * yearsInTomonth;
        isCalc = true;
      });
    }
  }

// ! This Resetscreen
  void clearPage() {
    setState(() {
      mortgageAmount.clear();
      mortgageTerm.clear();
      interestRate.clear();
      result = 0;
      isCalc = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mortgage Calculator",
          style: TextStyle(
            color: const Color.fromARGB(255, 1, 52, 3),
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(onPressed: clearPage, icon: Icon(Icons.refresh)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            // 📱 Portrait layout with scroll
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    InputsForCalculation(
                      mortgageAmountController: mortgageAmount,
                      mortgageTermController: mortgageTerm,
                      interestRateController: interestRate,
                    ),
                    SizedBox(height: 30),
                    InputButtonWidget(clacMortease: calcMortgage),
                    SizedBox(height: 30),
                    ResultSection(
                      isCalc: isCalc,
                      result: result,
                      totalRepayments: totalRepayments,
                    ),
                  ],
                ),
              ),
            );
          } else {
            // 💻 Landscape layout
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          InputsForCalculation(
                            mortgageAmountController: mortgageAmount,
                            mortgageTermController: mortgageTerm,
                            interestRateController: interestRate,
                          ),
                          SizedBox(height: 20),
                          InputButtonWidget(clacMortease: calcMortgage),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ResultSection(
                        isCalc: isCalc,
                        result: result,
                        totalRepayments: totalRepayments,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
