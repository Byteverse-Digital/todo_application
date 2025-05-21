part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class FetchTodoEvent extends TodoEvent{
  
}
class AddTodoEvent extends TodoEvent {
  final String title;
  final String description;

  AddTodoEvent({required this.title, required this.description});
}
