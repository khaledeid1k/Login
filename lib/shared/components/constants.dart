
const String emptyList=" Empty List";
const String archive="Archive";
const String done="Done";
const String id="id";
const String title="title";
const String time="time";
const String date="date";
const String status="status";
const String newStatus="new";
const String tableName="loll";
const String tasks="Tasks";
const String task="Task";
const String lastDate="2023-10-03";
const String dataBaseName="todo.dp";
String? checkEmpty(String field , String nameField  ){
  if (field.isEmpty == true) {
    return "$nameField shouldn't be empty ";
  }
  return null;
}
