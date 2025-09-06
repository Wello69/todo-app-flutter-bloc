import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth_bloc/auth_bloc.dart';
import '../blocs/todo_bloc/todo_bloc.dart';
import '../widgets/todo_item.dart';
import '../widgets/search_bar.dart' as custom_widgets;
import './add_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  void _loadTodos() {
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated) {
      context.read<TodoBloc>().add(LoadTodosEvent(userEmail: authState.email));
    }
  }

  void _onSearch(String query) {
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated) {
      context.read<TodoBloc>().add(
          SearchTodosEvent(query: query, userEmail: authState.email)
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          Navigator.pushReplacementNamed(context, '/');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Todos'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthBloc>().add(LogoutEvent());
              },
            ),
          ],
        ),
        body: Column(
          children: [
            custom_widgets.SearchBar(onSearch: _onSearch),
            Expanded(
              child: BlocConsumer<TodoBloc, TodoState>(
                listener: (context, state) {
                  if (state is TodoError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message))
                    );
                  }
                },
                builder: (context, state) {
                  if (state is TodoLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is TodoError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.message),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _loadTodos,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  if (state is TodosLoaded) {
                    if (state.todos.isEmpty) {
                      return const Center(
                        child: Text(
                          'No todos yet!\nTap the + button to add one.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: state.todos.length,
                      itemBuilder: (context, index) {
                        final todo = state.todos[index];
                        return TodoItem(
                          todo: todo,
                          onToggle: () {
                            final authState = context.read<AuthBloc>().state;
                            if (authState is Authenticated) {
                              context.read<TodoBloc>().add(
                                  ToggleTodoEvent(
                                      id: todo.id,
                                      userEmail: authState.email
                                  )
                              );
                            }
                          },
                          onDelete: () {
                            final authState = context.read<AuthBloc>().state;
                            if (authState is Authenticated) {
                              context.read<TodoBloc>().add(
                                  DeleteTodoEvent(
                                      id: todo.id,
                                      userEmail: authState.email
                                  )
                              );
                            }
                          },
                        );
                      },
                    );
                  }

                  return const Center(child: Text('No todos yet'));
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final authState = context.read<AuthBloc>().state;
            if (authState is Authenticated) {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTodoScreen(userEmail: authState.email),
                ),
              );
              _loadTodos();
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}