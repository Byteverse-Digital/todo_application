import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/constants/app_routes.dart';
import 'package:todo_application/features/home/presentation/blocs/bloc/todo_bloc.dart';
import 'package:todo_application/features/home/presentation/screens/add_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoBloc = context.read<TodoBloc>().add(FetchTodoEvent());

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page", style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.MyForm);
              },
            ),
          ),
        ],

        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is fetchTodoLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is fetchTodoFall) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is fetchTodoLoaded) {
            return ListView.builder(
              itemCount: state.todo.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: ListTile(
                    leading: Checkbox(
                      value: state.todo[index].isCompleted,
                      onChanged: (e) {},
                    ),
                    title: Text(state.todo[index].title),
                    subtitle: Text(state.todo[index].description),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete_outline),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
