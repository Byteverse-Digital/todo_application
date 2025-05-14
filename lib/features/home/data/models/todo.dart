import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Todo
{
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  Todo(
    {
      required this.id,
      required this.title,
      required this.description,
      required this.isCompleted
    }
  );
  factory Todo.fromMap(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      isCompleted: json['isCompleted'] as bool,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'completed': isCompleted,
    };
  }

}