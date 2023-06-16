import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index)=>defaultItemTasks(
          map: tasksList[index]
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
        , itemCount: tasksList.length );

  }
}
