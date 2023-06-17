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
      builder: (context,state){return ListView.separated(
          itemBuilder: (context,index)=>defaultItemTasks(
              map: baseCubit.tasksList[index]
          ),
          separatorBuilder:  (context,index)=> Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20.0
            ),
            child: Container(
              height: 2.0,
              color: Colors.grey[200],
              width: double.infinity,),
          )
          , itemCount: baseCubit.tasksList.length );},
    );

  }
}
