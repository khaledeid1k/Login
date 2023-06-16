import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_project/shared/cubit/states.dart';

class BaseCubit extends Cubit<BaseStates> {
  BaseCubit() : super(InitState());

  static BaseCubit getInstance(context) => BlocProvider.of(context);
  int currentIndex = 0;

  void changeCurrentIndex(currentIndex) {
    this.currentIndex = currentIndex;
    emit(CurrentIndexState(currentIndex));
  }
}
