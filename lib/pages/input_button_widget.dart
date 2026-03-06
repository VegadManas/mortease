import 'package:flutter/material.dart';

class InputButtonWidget extends StatelessWidget {
  final VoidCallback clacMortease;
  const InputButtonWidget({super.key, required this.clacMortease});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFd9db30)),
          onPressed: clacMortease,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calculate_sharp,
                size: 25,
                color: Colors.black,
              ),
              Text(
                "Calculate Repayments",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
