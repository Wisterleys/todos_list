import 'package:flutter/cupertino.dart';

abstract class Todo{
  Todo({
    required this.title,
    required this.data,
  });
  Text title;
  DateTime data;
}