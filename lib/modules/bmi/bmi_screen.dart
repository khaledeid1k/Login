import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_project/modules/bmi/bmi_result_screen.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});


  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool isMale=false;
  double heightOfPerson=187.0;
  double ageOfPerson=35;
  double weightOfPerson=80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
          centerTitle: true,
          backgroundColor: Color(0xFF0B0F1F),
        ),
        body: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale=true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image:AssetImage('assets/images/male.png'),
                            height: 90.0,
                            width: 90.0,),
                            SizedBox(height: 10.0,),
                            Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 25.0,
                                color:!isMale ? Colors.white24 : Colors.white ,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: !isMale ? Color(0xFF1B1A2E) : Colors.blue,
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image:AssetImage('assets/images/female.png'),
                              height: 90.0,
                              width: 90.0,),
                            SizedBox(height: 10.0,),

                            Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color:isMale ? Colors.white24 : Colors.white ,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                         color: isMale ? Color(0xFF1B1A2E) : Colors.blue,

                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF1B1A2E),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white24,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "${heightOfPerson.round()}",
                        style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white24,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                      value: heightOfPerson,
                      max: 240.0,
                      min: 50.0,
                      onChanged: (value) {
                       setState(() {
                         heightOfPerson=value;
                       });
                      }),
                ],
              ),
            ),
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${weightOfPerson.round()}",
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: 'weightOfPerson--',

                                onPressed: () {
                                  setState(() {
                                    weightOfPerson--;
                                  });
                                },
                                child: Icon(Icons.remove),
                                mini: true,
                              ),
                              FloatingActionButton(
                                heroTag: 'weightOfPerson++',

                                onPressed: () {
                                  setState(() {
                                    weightOfPerson++;
                                  });
                                },
                                child: Icon(Icons.add),
                                mini: true,
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFF1B1A2E),
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${ageOfPerson.round()}",
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: 'ageOfPerson--',

                                onPressed: () {
                                  setState(() {
                                    ageOfPerson--;
                                  });
                                },
                                child: Icon(Icons.remove),
                                mini: true,
                              ),
                              FloatingActionButton(
                                heroTag: 'ageOfPerson++',
                                onPressed: () {
                                  setState(() {
                                    ageOfPerson++;
                                  });
                                },
                                child: Icon(Icons.add),
                                mini: true,
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFF1B1A2E),
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFF1B1A2E),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
            child: TextButton(
              onPressed: () {
                setState(() {
                  double result=weightOfPerson/pow(heightOfPerson/100,2).round();
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder:
                              (context)=>BMIResult(
                                isMale: isMale,age: ageOfPerson,
                                result:result ,
                                weight: weightOfPerson,


                              )));

                });
              },
              child: Text("Calculator",style: TextStyle(fontSize: 20.0),),

            ),
          ),
        ]),
        backgroundColor: const Color(0xFF0B0F1F));
  }
}
