import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class Done extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var baseCubit = BaseCubit.getInstance(context);

    return BlocConsumer<BaseCubit,BaseStates>(
      listener: (context,state){},
      builder: (context,state){
return defaultTasksBuilder(inputList: baseCubit.doneTasksList,icon:Icons.check_box );

        },

    );

  }

}
