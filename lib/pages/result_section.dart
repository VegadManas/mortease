import 'package:flutter/material.dart';

class ResultSection extends StatelessWidget {
  const ResultSection({
    super.key,
    required this.isCalc,
    required this.result,
    required this.totalRepayments,
  });
  final double result;
  final bool isCalc;
  final double totalRepayments;

  @override
  Widget build(BuildContext context) {
    return isCalc
        ? AfterTheResult(
            result: result,
            totalRepayments: totalRepayments,
          )
        : BeforeTheResult();
  }
}

// After the result section
class AfterTheResult extends StatelessWidget {
  const AfterTheResult({
    super.key,
    required this.result,
    required this.totalRepayments,
  });

  final double totalRepayments;
  final double result;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xff133040),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Text(
              "Your Results",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SizedBox(height: 10),
            Text(
              "Your results are shown below based on the information you provided. To adjust the result, edit the form and click calculate repayments again.",
              style: TextStyle(
                color: const Color.fromARGB(255, 186, 186, 190),
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: Color(0xFF0e2431),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your monthly repayments",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Text(
                      "₹ ${result.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Color(0xFFd8df25),
                        fontSize: 30,
                      ),
                    ),
                    Divider(),
                    Text(
                      "Total amount over term",
                      style: TextStyle(
                        color: const Color.fromARGB(217, 255, 255, 255),
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "₹ ${totalRepayments.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Before the result section
class BeforeTheResult extends StatelessWidget {
  const BeforeTheResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xff133040),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 10),
            Image(
              image: AssetImage('assets/images/illustration.png'),
            ),
            Text(
              "Results shown here",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Complete the form and click 'Calculate Repayments' to see what your monthly repayment would be",
                style: TextStyle(
                  color: const Color.fromARGB(255, 186, 186, 190),
                  fontSize: 17,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
