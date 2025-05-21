part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

class fetchTodoLoading extends TodoState{

}


class fetchTodoLoaded extends TodoState
{
  final List<Todo> todo;
  fetchTodoLoaded(this.todo);
}


class fetchTodoFall extends TodoState
{
  final String errorMessage;
  fetchTodoFall(this.errorMessage);
}


// add todo events
class AddTodoLoadingState extends TodoState {}
class AddTodoSuccessState extends TodoState {
  final String message;
  AddTodoSuccessState(this.message);
}
class AddTodoFailState extends TodoState {
  final String message;
  AddTodoFailState(this.message);
}
