import 'package:get_it/get_it.dart';
import 'package:todo_application/core/api/api_calls.dart';
import 'package:todo_application/features/home/data/repositories/todo_repository.dart';
import 'package:todo_application/features/home/data/sources/todo_data_source.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  // Register ApiCalls first, since it's used by TodoDataSource
  getIt.registerLazySingleton<ApiCalls>(() => ApiCalls());

  // Register TodoDataSource and inject ApiCalls from GetIt
  getIt.registerLazySingleton<TodoDataSource>(
    () => TodoDataSourceImpl(getIt<ApiCalls>()),
  );

  // Register TodoRepository and inject TodoDataSource from GetIt
  getIt.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(getIt<TodoDataSource>()),
  );
}
