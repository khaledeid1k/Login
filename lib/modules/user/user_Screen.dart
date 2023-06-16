import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';


class Useres extends StatelessWidget {
  List <ItemUser> users= [
    ItemUser(1,"A","1135415"),
    ItemUser(2,"b","23145345"),
    ItemUser(3,"c","334545"),
    ItemUser(4,"d","45432534"),
    ItemUser(5,"e","534534"),
    ItemUser(6,"f","6345345"),
    ItemUser(7,"g","74532"),
    ItemUser(7,"j","834534543"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User"),),
      body: ListView.separated(
          itemBuilder: (context, index)=>listUser(users[index]),
          separatorBuilder:(context, index)=>Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0
            ), child: SizedBox(height: 20.0,)
          ),
          itemCount: users.length,
      ),
    );
  }
  Widget listUser(ItemUser user) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.blue,
              child: Text(
                "${user.id}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${user.name}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 21.0,
                  ),
                ),
                Text(
                  "${user.phone}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ],
        ),

      ],
    ),
  );
}
