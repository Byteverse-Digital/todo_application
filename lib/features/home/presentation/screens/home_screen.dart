import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/features/home/presentation/blocs/bloc/todo_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Home Page",style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {

          if (state is fetchTodoLoading)
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is fetchTodoFall)
          {
            return Center(child: Text(state.errorMessage),);
          }
          if (state is fetchTodoLoaded)
          {
            return Center(
              child: Text("${state.todo.length}"),
            );
          }
          else
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}