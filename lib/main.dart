import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:login_project/modules/login/login_screen.dart';
import 'package:login_project/modules/user/user_Screen.dart';
import 'package:login_project/shared/bloc_observer.dart';

import 'layout/home.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/messenger/messenger_screen.dart';
// import 'login_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home());
  }

}

