import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:login_project/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

import '../components/constants.dart';

class BaseCubit extends Cubit<BaseStates> {
  BaseCubit() : super(InitState());

  static BaseCubit getInstance(context) => BlocProvider.of(context);
  int currentIndex = 0;
  late Database database;
  var logger = Logger();
  Icon iconOfFloating = const Icon(Icons.edit);
  bool isBottomSheetShow = false;
  List<Map<String, Object?>> tasksList = [];




  void createDataBase()  {
   openDatabase(("todo.dp"), version: 9,
        onCreate: (Database db, int version) {
          db.execute(
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
            tasksList = tasksList.reversed.toList();


            emit(GetDataBaseState());
            logger.d(value.toString());
          });
        }).then((value){
     database =value;

     emit(CreateDataBaseState());
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
        emit(InsertDataBaseState());
        getDataFromDataBase(database).then((value) {
          tasksList = value;
          tasksList = tasksList.reversed.toList();

          emit(GetDataBaseState());
          logger.d(value.toString());
        });

      }).catchError((onError) {
        logger.e("error when insert ${onError.toString()}");
      });
    });
  }

  Future getDataFromDataBase(database) async {
    return await database.rawQuery('SELECT * FROM loll');
  }



  void changeCurrentIndex(currentIndex) {
    this.currentIndex = currentIndex;
    emit(CurrentIndexState());
  }
  void changeBottomSheetIconState(iconOfFloating,isBottomSheetShow) {
    this.iconOfFloating = iconOfFloating;
    this.isBottomSheetShow = isBottomSheetShow;
    emit(ChangeBottomSheetIconState());
  }




}
