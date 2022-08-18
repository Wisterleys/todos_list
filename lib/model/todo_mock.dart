import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Todo{
  Todo.fromJson(Map<String, dynamic> json)
  : title = json['Titulo'],
  date = DateTime.parse(json['date']);
  Todo({
    required this.title,
    required this.date,
  });
  String title;
  DateTime date;

  Map<String, dynamic> toJson(){
    return {
      "Titulo":title,
      "date": date.toIso8601String()
    };
  }
}