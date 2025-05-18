import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:todo_application/core/services/service_locator.dart';
import 'package:todo_application/features/home/data/repositories/todo_repository.dart';
import 'package:todo_application/features/home/presentation/blocs/bloc/todo_bloc.dart';
import 'package:todo_application/features/home/presentation/screens/add_form.dart';
import 'package:todo_application/features/home/presentation/screens/home_screen.dart';
import 'package:todo_application/constants/app_routes.dart';


void main() {
  serviceLocator();
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => TodoBloc(getIt<TodoRepository>())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HomeScreen: (ctx) => const HomeScreen(),
          AppRoutes.MyForm: (ctx) => const MyForm(),
        },
      ),
    );
  }
}
