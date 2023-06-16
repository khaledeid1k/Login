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
  List<String> listTextAppBar = ["Tasks", "Done", "Archived"];
  List<Map<String, Object?>> allDataBase = [];
  late Database database;
  var logger = Logger();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  Icon iconOfFloating = const Icon(Icons.edit);
  bool isBottomSheetShow = false;
  var taskText = TextEditingController();
  var timeText = TextEditingController();
  var dateText = TextEditingController();

  @override
  void initState() {
    // super.initState();
    createDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BaseCubit(),
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
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Tasks"),
                BottomNavigationBarItem(icon: Icon(Icons.done), label: "Done"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive), label: "Archived"),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (isBottomSheetShow) {
                  if (formKey.currentState?.validate() == true) {
                    insertTask(
                            title: taskText.text,
                            date: dateText.text,
                            time: timeText.text)
                        .then((value) {
                      getDataFromDataBase(database).then((value) {
                        logger.d(value.toString());
                        Navigator.of(context).pop();
                        isBottomSheetShow = false;
                        // setState(() {
                        tasksList = value;
                        iconOfFloating = const Icon(Icons.edit);
                        // });
                      });
                    });
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
                                      labelText: "Task",
                                      keyboardType: TextInputType.text,
                                      validator: (v) {
                                        if (v?.isEmpty == true) {
                                          return "Task shouldn't be empty ";
                                        }
                                        return null;
                                      }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  defaultFormField(
                                    controller: timeText,
                                    prefixIcon: Icon(Icons.timelapse),
                                    labelText: "Time",
                                    keyboardType: TextInputType.datetime,
                                    validator: (v) {
                                      if (v?.isEmpty == true) {
                                        return "Time shouldn't be empty ";
                                      }
                                      return null;
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
                                    labelText: "Date",
                                    keyboardType: TextInputType.datetime,
                                    validator: (v) {
                                      if (v?.isEmpty == true) {
                                        return "Date shouldn't be empty ";
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate:
                                                  DateTime.parse("2023-10-03"))
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
                        isBottomSheetShow = false;
                        // setState(() {
                        iconOfFloating = const Icon(Icons.edit);
                        // });
                      });

                  isBottomSheetShow = true;
                  // setState(() {
                  iconOfFloating = const Icon(Icons.add);
                  // });
                }
              },
              child: iconOfFloating,
            ),
            body: tasksList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : screens[baseCubit.currentIndex],
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  void createDataBase() async {
    database = await openDatabase(("todo.dp"), version: 9,
        onCreate: (Database db, int version) {
      db
          .execute(
              'CREATE TABLE loll(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
          .then((value) {
        logger.d("Done Create");
      }).catchError((onError) {
        logger.e(onError.toString());
      });
    }, onOpen: (database) {
      logger.d("open DataBase");
      getDataFromDataBase(database).then((value) {
        tasksList = value;
        logger.d(value.toString());
      });
    });
  }

  Future insertTask({
    required String title,
    required String date,
    required String time,
  }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO loll(title, date, time, status) VALUES("$title", "$date", "$time", "new") ')
          .then((value) {
        logger.d("$value inset Done ");
      }).catchError((onError) {
        logger.e("error when insert ${onError.toString()}");
      });
    });
  }

  Future getDataFromDataBase(database) async {
    return await database.rawQuery('SELECT * FROM loll');
  }
}


