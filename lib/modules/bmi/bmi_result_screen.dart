import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  final bool isMale;
  final double age;
  final double result;
  final double weight;

  BMIResult({
    required this.isMale,
    required this.age,
    required this.result,
    required this.weight,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI RESULT"),
          centerTitle: true,
          backgroundColor: Color(0xFF0B0F1F),
        ),
        backgroundColor: const Color(0xFF0B0F1F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Gender: ${isMale ? "Male":"Female"}",style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),
            Text("Age: ${age.round()}",style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),
            Text("Weight: ${weight.round()}",style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),
            Text("Result: ${result.round()}",style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),

          ],
        ),
      ),
    );

  }
}
