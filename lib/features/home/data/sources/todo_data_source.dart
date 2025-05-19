import 'package:todo_application/core/api/api_calls.dart';
import 'package:todo_application/features/home/data/models/todo.dart';

abstract class TodoDataSource {
  Future<List<Todo>> fetchTodo();
  Future<List<Todo>> storeTodo({required Map<String, dynamic> todo});
}

  class TodoDataSourceImpl extends TodoDataSource
  {
    final  ApiCalls apiCalls;
    TodoDataSourceImpl(this.apiCalls);


    @override
    Future<List<Todo>> fetchTodo() async{
      final result = await apiCalls.getData(endpoints: "todo") as List;
      return result.map((todo) => Todo.fromMap(todo)).toList();
      // throw UnimplementedError();
    }
    
      @override
      Future<List<Todo>> storeTodo({required Map<String, dynamic> todo}) async {
        final result = await apiCalls.sendData(
          endpoints: "todo",
          data: todo,
        ) as List;
        return result['message'];
      }
  }

