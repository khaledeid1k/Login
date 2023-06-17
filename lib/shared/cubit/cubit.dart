import 'package:bloc/bloc.dart';
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
  List<Map<String, Object?>> newTasksList = [];
  List<Map<String, Object?>> doneTasksList = [];
  List<Map<String, Object?>> archivedTasksList = [];




  void createDataBase()  async {
   await openDatabase((dataBaseName), version: 9,
        onCreate: (Database db, int version) {
          db.execute(
              'CREATE TABLE $tableName(id INTEGER PRIMARY KEY, $title TEXT, $date TEXT, $time TEXT, $status TEXT)')
              .then((value) {
            logger.d("Done Create");
          }).catchError((onError) {
            logger.e(onError.toString());
          });
        }, onOpen: (database) {
          logger.d("open DataBase");
          getDataFromDataBase(database);
        }).then((value){
     database =value;

     emit(CreateDataBaseState());
   });
  }
   insertTask({
    required String subTitle,
    required String subDate,
    required String subTime,
  }) async {
    await database.transaction((txn) {
    return   txn
          .rawInsert(
          'INSERT INTO $tableName($title, $date, $time, $status) VALUES("$subTitle", "$subDate", "$subTime", "$newStatus") ')
          .then((value) {
        logger.d("$value inset Done ");
        emit(InsertDataBaseState());
        getDataFromDataBase(database);
      }).catchError((onError) {
        logger.e("error when insert ${onError.toString()}");
      });
    });
  }

 void getDataFromDataBase(Database database) async {
     await database.rawQuery('SELECT * FROM $tableName').then((value) {
      newTasksList.clear();
      doneTasksList.clear();
      archivedTasksList.clear();
      for (var element in value) {
        if(element[status]==newStatus){ newTasksList.add(element); }
        else if (element[status]==done){doneTasksList.add(element);}
        else{archivedTasksList.add(element);}
      }
      newTasksList = newTasksList.reversed.toList();
      doneTasksList = doneTasksList.reversed.toList();
      archivedTasksList = archivedTasksList.reversed.toList();
      emit(GetDataBaseState());
      logger.d(value.toString());
    });
  }

  void updateDataBase({required String subStatus, required int subId}) async {
      await database.rawUpdate(
        'UPDATE $tableName SET $status = ?  WHERE $id = ?',
        [subStatus,subId ]).then((value){
        getDataFromDataBase(database);
        emit(UpdateBaseState());


    });
    
  }

  void deleteDataBase({required int subId}) async {
      await database.rawDelete('DELETE FROM $tableName WHERE $id = ?', [subId])
          .then((value){
        getDataFromDataBase(database);
        emit(DeleteBaseState());
    });


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
