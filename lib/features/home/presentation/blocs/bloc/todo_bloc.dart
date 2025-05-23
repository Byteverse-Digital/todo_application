import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_application/features/home/data/models/todo.dart';
import 'package:todo_application/features/home/data/repositories/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc(this.todoRepository) : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {
    
    });
    on<FetchTodoEvent>((event,emit) async
    {
      emit(fetchTodoLoading());
      final result = await todoRepository.fetchTodo();

      result.fold( (error) => emit(fetchTodoFall(error.errorMessage)), (success)=> emit(fetchTodoLoaded(success)));
    });
    
  }
}
