import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  width = double.infinity,
  Color color = Colors.blue,
  required String text,
  bool isUpperCase = true,
  double radius = 10.0,
  required Function() function,


}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius)
    ),
    child: MaterialButton(onPressed:function,
      child: Text(isUpperCase ? text.toUpperCase() : text
        , style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget  defaultFormField({
  required TextEditingController controller ,
  bool obscureText= false,
  required Icon prefixIcon,
   Widget? suffixIcon,
  required String labelText,
  required TextInputType keyboardType,
  required String? Function(String?)? validator,
  Function()? onSuffixIconPressed,
  Function()? onTap,

})=>  TextFormField(
  controller: controller,
  keyboardType:keyboardType ,
  obscureText: obscureText, // to hidden text
  onTap:onTap ,
  decoration:  InputDecoration(
    labelText: labelText,
    prefixIcon:prefixIcon,
    suffixIcon: suffixIcon != null ? IconButton(
      onPressed: onSuffixIconPressed,
      icon: suffixIcon,
    )
        : null,
    border: const OutlineInputBorder(),
  ),
  validator: validator,


);


Widget defaultItemTasks({
  required Map map
}) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 40.0,
        child: Text(map['time']),
      ),
      const SizedBox(width: 10.0,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(map['title'], style:
            const TextStyle(fontWeight: FontWeight.bold,
              fontSize: 30.0,),),
            Text(map['date'], style:
            const TextStyle(fontSize: 20.0,color: Colors.grey),),
          ],
        ),
      ),
    ],
  ),

);