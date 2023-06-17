import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_project/shared/cubit/cubit.dart';
import 'package:login_project/shared/cubit/states.dart';
import '../../shared/components/components.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var baseCubit = BaseCubit.getInstance(context);

    return BlocConsumer<BaseCubit,BaseStates>(
      listener: (context,state){},
      builder: (context,state){

        return defaultTasksBuilder(inputList: baseCubit.newTasksList,icon:Icons.menu );

          },
    );

  }
}
