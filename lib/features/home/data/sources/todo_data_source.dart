import 'package:todo_application/core/api/api_calls.dart';
import 'package:todo_application/features/home/data/models/todo.dart';

abstract class TodoDataSource {
  Future<List<Todo>> fetchTodo();
  }

  class TodoDataSourceImpl extends TodoDataSource
  {
    final  ApiCalls apiCalls;
    TodoDataSourceImpl(this.apiCalls);


    @override
    Future<List<Todo>> fetchTodo() async{
      final result = await apiCalls.getData(endpoints: "todo");
      return result.map((todo) => Todo.fromMap(todo)).toList();
      // throw UnimplementedError();
    }
  }

