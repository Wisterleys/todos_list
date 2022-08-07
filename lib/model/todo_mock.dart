import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Todo{
  Todo({
    required this.title,
    required this.date,
  });
  Text title;
  Text date;
}