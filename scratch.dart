import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  await task2();
  task3();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future task2() async {
  //this is sync programming
  Duration threeSeconds = Duration(seconds: 5);
  // sleep(threeSeconds);

 late String result;

  //here we are making this to happen in the background

  await Future.delayed(threeSeconds, (){
    result = 'task 2 data';
    print('Task 2 complete');
  });

//  the above task will happen at the background


return result;

}

void task3() {
  String result = 'task 3 data';
  print('Task 3 complete');
}
