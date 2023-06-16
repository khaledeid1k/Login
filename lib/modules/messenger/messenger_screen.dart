
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messenger extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 10,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/OIP.-cjk1Z1ep4K-8TBcTyBhtgHaEU?pid=ImgDet&rs=1'),
              radius: 20.0,
            ),
            SizedBox(
              width: 25.0,
            ),
            Text(
              "Chats",
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
                child: Icon(
              Icons.camera_alt,
              size: 16,
            )),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
                child: Icon(
              Icons.edit,
              size: 16,
            )),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text("Search"),
                    ],
                  ),
                ),
              ),
             Container(
               height: 105.0,
               child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                   itemBuilder:  (context,index)=>buildStories(),
                   separatorBuilder:  (context,index)=>buildSpace(),
                   itemCount: 10),
             ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context, index)=>buildMessages(),
                  separatorBuilder: (context,index)=>buildSpace(),
                  itemCount: 10)




            ],
          ),
        ),
      ),
    );

  }

Widget buildMessages()=>Row(
    children: [
      Stack(
          alignment: Alignment.bottomRight,
          children:[
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://th.bing.com/th/id/OIP.iLdqI9f-iJt69mljvB3SsQHaEo?pid=ImgDet&rs=1"),
              radius: 40.0,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  bottom: 4.0, end: 4.0
              ),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 7.0,
              ),
            )

          ]
      ),
      SizedBox(width: 10,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Friend LOL "
                " Friend LOL"
                " Friend LOL"
                " Friend LOL"
                " Friend LOL"
                " Friend LOL"
                " Friend LOL"
                " Friend LOL",
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,overflow: TextOverflow.ellipsis,),
            SizedBox(height: 5.0,),

            Row(
              children: [
                Text("Hi LOL",),
                SizedBox(width: 5.0,),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text("12:48 am",),

              ],
            )
          ],
        ),
      ),
    ],
  );
  Widget buildStories()=>Row(children: [
  Container(
  width: 80.0,
  child: Column(
  children: [
  Stack(
  alignment: Alignment.bottomRight,
  children: [
  CircleAvatar(
  backgroundImage: NetworkImage(
  "https://th.bing.com/th/id/OIP.iLdqI9f-iJt69mljvB3SsQHaEo?pid=ImgDet&rs=1"),
  radius: 40.0,
  ),
  Padding(
  padding: const EdgeInsetsDirectional.only(
  bottom: 4.0, end: 4.0),
  child: CircleAvatar(
  backgroundColor: Colors.green,
  radius: 7.0,
  ),
  ),
  ],
  ),
  SizedBox(
  height: 5.0,
  ),
  Text(
  "LOL",
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  ),
  ],
  ),
  ),
  SizedBox(width: 20.0,),
  Container(
  width: 80.0,
  child: Column(
  children: [
  Stack(
  alignment: Alignment.bottomRight,
  children: [
  CircleAvatar(
  backgroundImage: NetworkImage(
  "https://th.bing.com/th/id/OIP.iLdqI9f-iJt69mljvB3SsQHaEo?pid=ImgDet&rs=1"),
  radius: 40.0,
  ),
  Padding(
  padding: const EdgeInsetsDirectional.only(
  bottom: 4.0, end: 4.0),
  child: CircleAvatar(
  backgroundColor: Colors.green,
  radius: 7.0,
  ),
  ),
  ],
  ),
  SizedBox(
  height: 5.0,
  ),
  Text(
  "LOL",
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  ),
  ],
  ),
  ),
  SizedBox(width: 20.0,),
  Container(
  width: 80.0,
  child: Column(
  children: [
  Stack(
  alignment: Alignment.bottomRight,
  children: [
  CircleAvatar(
  backgroundImage: NetworkImage(
  "https://th.bing.com/th/id/OIP.iLdqI9f-iJt69mljvB3SsQHaEo?pid=ImgDet&rs=1"),
  radius: 40.0,
  ),
  Padding(
  padding: const EdgeInsetsDirectional.only(
  bottom: 4.0, end: 4.0),
  child: CircleAvatar(
  backgroundColor: Colors.green,
  radius: 7.0,
  ),
  ),
  ],
  ),
  SizedBox(
  height: 5.0,
  ),
  Text(
  "LOL",
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  ),
  ],
  ),
  ),
  SizedBox(width: 20.0,),
  Container(
  width: 80.0,
  child: Column(
  children: [
  Stack(
  alignment: Alignment.bottomRight,
  children: [
  CircleAvatar(
  backgroundImage: NetworkImage(
  "https://th.bing.com/th/id/OIP.iLdqI9f-iJt69mljvB3SsQHaEo?pid=ImgDet&rs=1"),
  radius: 40.0,
  ),
  Padding(
  padding: const EdgeInsetsDirectional.only(
  bottom: 4.0, end: 4.0),
  child: CircleAvatar(
  backgroundColor: Colors.green,
  radius: 7.0,
  ),
  ),
  ],
  ),
  SizedBox(
  height: 5.0,
  ),
  Text(
  "LOL",
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  ),
  ],
  ),
  ),
  SizedBox(width: 20.0,),
  Container(
  width: 80.0,
  child: Column(
  children: [
  Stack(
  alignment: Alignment.bottomRight,
  children: [
  CircleAvatar(
  backgroundImage: NetworkImage(
  "https://th.bing.com/th/id/OIP.iLdqI9f-iJt69mljvB3SsQHaEo?pid=ImgDet&rs=1"),
  radius: 40.0,
  ),
  Padding(
  padding: const EdgeInsetsDirectional.only(
  bottom: 4.0, end: 4.0),
  child: CircleAvatar(
  backgroundColor: Colors.green,
  radius: 7.0,
  ),
  ),
  ],
  ),
  SizedBox(
  height: 5.0,
  ),
  Text(
  "LOL",
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  ),
  ],
  ),
  ),
  SizedBox(width: 20.0,),
  ],);
  Widget buildSpace()=>SizedBox(height:20.0 ,width: 20.0,) ;

}



// Padding(
// padding: const EdgeInsets.all(10.0),
// child: TextField(
// decoration: InputDecoration(
// hintText: "search",
// prefixIcon: Icon(Icons.search),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(
// 10.0), // Adjust the radius value as needed
// ),
// contentPadding: EdgeInsets.all(0.0),
// filled: true,
// fillColor: Colors.grey[200],
// ),
// ),
// ),
