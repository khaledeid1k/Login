import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../cubit/cubit.dart';
import 'constants.dart';

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
        color: color, borderRadius: BorderRadius.circular(radius)),
    child: MaterialButton(
      onPressed: function,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget defaultFormField({
  required TextEditingController controller,
  bool obscureText = false,
  required Icon prefixIcon,
  Widget? suffixIcon,
  required String labelText,
  required TextInputType keyboardType,
  required String? Function(String?)? validator,
  Function()? onSuffixIconPressed,
  Function()? onTap,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      // to hidden text
      onTap: onTap,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: onSuffixIconPressed,
                icon: suffixIcon,
              )
            : null,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );

Widget defaultItemTasks({required Map map, required context}) {
  var baseCubit = BaseCubit.getInstance(context);

  return Dismissible(
    key: Key(map[id].toString()),
    onDismissed: (direction) {
      baseCubit.deleteDataBase(subId: map[id]);
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35.0,
            child: Text(map[time]),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 179,
                  child: Text(
                    map[title],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                ),
                Text(
                  map[date],
                  style: const TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // Align the icons to the end of the row
                children: [
                  IconButton(
                      onPressed: () {
                        baseCubit.updateDataBase(
                            subStatus: done, subId: map[id]);
                      },
                      icon: const Icon(
                        Icons.check_box,
                        color: Colors.green,
                      )),
                  IconButton(
                      onPressed: () {
                        baseCubit.updateDataBase(
                            subStatus: archive, subId: map[id]);
                      },
                      icon: const Icon(
                        Icons.archive,
                        color: Colors.black38,
                      )),
                ]),
          ),
        ],
      ),
    ),
  );
}

Widget defaultFallback(IconData icon) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 100.0,
          color: Colors.black38,
        ),
        const Text(
          "No Tasks Yet , Please add Some Tasks",
          style: TextStyle(fontSize: 15.0),
        ),
      ],
    ),
  );
}

Widget defaultTasksBuilder({required List inputList, required IconData icon}) {
  return ConditionalBuilder(
    condition: inputList.isNotEmpty,
    fallback: (c) => defaultFallback(icon),
    builder: (c) => ListView.separated(
        itemBuilder: (context, index) =>
            defaultItemTasks(map: inputList[index], context: context),
        separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(start: 20.0),
              child: Container(
                height: 2.0,
                color: Colors.grey[200],
                width: double.infinity,
              ),
            ),
        itemCount: inputList.length),
  );
}
