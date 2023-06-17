import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:login_project/modules/Archived/archived_screen.dart';
import 'package:login_project/modules/Done/done_screen.dart';
import 'package:login_project/modules/tasks/tasks_screen.dart';
import 'package:login_project/shared/components/components.dart';
import 'package:login_project/shared/cubit/cubit.dart';
import 'package:sqflite/sqflite.dart';

import '../shared/components/constants.dart';
import '../shared/cubit/states.dart';

class Home extends StatelessWidget {
  List<Widget> screens = [Tasks(), Done(), Archived()];
  List<String> listTextAppBar = [tasks, done,archive];
  List<Map<String, Object?>> allDataBase = [];
  var logger = Logger();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var taskText = TextEditingController();
  var timeText = TextEditingController();
  var dateText = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BaseCubit()..createDataBase(),
      child: BlocConsumer<BaseCubit, BaseStates>(
        builder: (BuildContext context, BaseStates state) {
          var baseCubit = BaseCubit.getInstance(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              automaticallyImplyLeading: false, // Hide the back arrow button

              title: Text(listTextAppBar[baseCubit.currentIndex]),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: baseCubit.currentIndex,
              onTap: (value) {
                baseCubit.changeCurrentIndex(value);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: tasks),
                BottomNavigationBarItem(icon: Icon(Icons.done), label: done),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive), label: archive),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (baseCubit.isBottomSheetShow) {
                  if (formKey.currentState?.validate() == true) {
                    baseCubit.insertTask(
                            subTitle: taskText.text,
                            subDate: dateText.text,
                            subTime: timeText.text);
                    Navigator.of(context).pop();
                    baseCubit.changeBottomSheetIconState(const Icon(Icons.edit),false);
                  }
                } else {
                  scaffoldKey.currentState
                      ?.showBottomSheet((context) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultFormField(
                                      controller: taskText,
                                      prefixIcon: Icon(Icons.menu),
                                      labelText: task,
                                      keyboardType: TextInputType.text,
                                      validator: (v) {
                                        return  checkEmpty(v!,task);

                                      }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  defaultFormField(
                                    controller: timeText,
                                    prefixIcon: Icon(Icons.timelapse),
                                    labelText: time,
                                    keyboardType: TextInputType.datetime,
                                    validator: (v) {
                                      return  checkEmpty(v!,time);
                                    },
                                    onTap: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) {
                                        timeText.text = value!.format(context);
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  defaultFormField(
                                    controller: dateText,
                                    prefixIcon: const Icon(Icons.date_range),
                                    labelText: date,
                                    keyboardType: TextInputType.datetime,
                                    validator: (v) {
                                    return  checkEmpty(v!,date);
                                    },
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate:
                                                  DateTime.parse(lastDate))
                                          .then((value) {
                                        dateText.text = DateFormat.yMMMd()
                                            .format(value!)
                                            .toString();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }, elevation: 15.0)
                      .closed
                      .then((value) {
                        baseCubit.changeBottomSheetIconState(const Icon(Icons.edit),false);
                      });
                  baseCubit.changeBottomSheetIconState(const Icon(Icons.add),true);
                }
              },
              child: baseCubit.iconOfFloating,
            ),
            body: screens[baseCubit.currentIndex],
          );
        },
        listener: (context, state) {},
      ),
    );
  }



}


