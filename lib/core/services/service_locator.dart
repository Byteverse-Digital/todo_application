import 'package:get_it/get_it.dart';
import 'package:todo_application/core/api/api_calls.dart';
import 'package:todo_application/features/home/data/repositories/todo_repository.dart';
import 'package:todo_application/features/home/data/sources/todo_data_source.dart';

final GetIt getIt = GetIt.instance();

serviceLocator()
{
  getIt.registerLazySingleton<ApiCalls>(getIt<ApiCalls>);

  getIt.registerLazySingleton<TodoDataSource>(getIt<TodoDataSource>);

  getIt.registerLazySingleton<TodoRepository>(getIt<TodoRepository>);
}
