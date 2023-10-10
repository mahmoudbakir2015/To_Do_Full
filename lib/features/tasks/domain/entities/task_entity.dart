import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MyTask extends Equatable {
  int? id; //  TILL KNOW WHAT WILL HAPPEN
  String date;
  String time;
  String content;
  String isArc;
  String isDone;
  MyTask({
    this.id,
    required this.date,
    required this.time,
    required this.content,
    required this.isArc,
    required this.isDone,
  });

  @override
  List<Object?> get props => [
        date,
        time,
        content,
        isArc,
        id,
        isDone,
      ];
}
