import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/auth_bloc/auth_bloc.dart';
import 'blocs/todo_bloc/todo_bloc.dart';
import 'services/shared_prefs_service.dart';
import 'services/todo_repository.dart';
import 'screens/login_screen.dart';
import 'screens/todo_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SharedPrefsService prefsService = SharedPrefsService();
  final TodoRepository todoRepository = TodoRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(prefsService: prefsService),
        ),
        BlocProvider(
          create: (context) => TodoBloc(todoRepository: todoRepository),
        ),
      ],
      child: MaterialApp(
        title: 'My Todos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          '/todos': (context) => const TodoListScreen(),
        },
      ),
    );
  }
}