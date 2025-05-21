import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_application/core/api/api_error.dart';
import 'package:todo_application/features/home/data/sources/todo_data_source.dart';

import '../models/todo.dart';

abstract class TodoRepository {
  Future<Either<ApiError, List<Todo>>> fetchTodo();
  Future<Either<ApiError, String>> storeTodo({
    required Map<String, dynamic> todo,
  });
}

class TodoRepositoryImpl extends TodoRepository {
  final TodoDataSource todoDataSource;
  TodoRepositoryImpl(this.todoDataSource);

  @override
  Future<Either<ApiError, List<Todo>>> fetchTodo() async {
    //
    try {
      final result = await todoDataSource.fetchTodo();
      return right<ApiError, List<Todo>>(result);
    } catch (e) {
      return left<ApiError, List<Todo>>(ApiError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<ApiError, String>> storeTodo({
    required Map<String, dynamic> todo,
  }) async {
    try {
      final result = await todoDataSource.storeTodo(formData: FormData.fromMap(todo));
      return right(result);
    } catch (e) {
      return left(ApiError(errorMessage: e.toString()));
    }
  }
}
