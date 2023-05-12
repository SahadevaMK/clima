import 'dart:io';

void main(){
  PerformTask();
}

void PerformTask() async{
  task1();
  String task2result = await task2();
  task3(task2result);
}

void task1(){
  String result = 'task 1 data';
  print('task 1 complete');
}
Future<String> task2()async{
  Duration threeseconds = Duration(seconds: 3);
  String result = '';
  await Future.delayed(threeseconds,(){
      result = 'task 2 data';
    print('task 2 complete');
  });
  return result;
}
void task3(String task2input){
  String result = 'task 3 data';
  print('task 3 complete with $task2input');
}