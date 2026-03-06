import 'package:flutter/material.dart';

// Global form key to access the form state
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class InputsForCalculation extends StatelessWidget {
  final TextEditingController mortgageAmountController;
  final TextEditingController mortgageTermController;
  final TextEditingController interestRateController;

  const InputsForCalculation({
    super.key,
    required this.mortgageAmountController,
    required this.mortgageTermController,
    required this.interestRateController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextFieldWidget(
              icons: Icon(Icons.currency_rupee_sharp),
              hint: "Mortgage Amount",
              controller: mortgageAmountController,
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              icons: Icon(Icons.calendar_month),
              hint: "Mortgage Term",
              controller: mortgageTermController,
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              icons: Icon(Icons.percent),
              hint: "Interest Rate",
              controller: interestRateController,
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Icon icons;

  const TextFieldWidget({
    super.key,
    required this.hint,
    required this.controller,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: hint,
        floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 93, 95, 3)),
        filled: true,
        fillColor: Color(0xFFF2F2F2),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color.fromRGBO(109, 111, 4, 1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFd9db30),
          ),
        ),
        suffixIcon: icons,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter $hint';
        }
        if (hint == "Interest Rate") {
          final rate = double.tryParse(value);
          if (rate == null || rate <= 0 || rate > 100) {
            return 'Enter valid % (0-100)';
          }
        } else if (hint == "Mortgage Term") {
          final term = double.tryParse(value);
          if (term == null || term <= 0) {
            return 'Enter a valid term';
          }
          if (term > 30) {
            return 'Term cannot exceed 30 years';
          }
        } else {
          final number = double.tryParse(value);
          if (number == null || number <= 0) {
            return 'Enter a valid number';
          }
        }
        return null;
      },
    );
  }
}
