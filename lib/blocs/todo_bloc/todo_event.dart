part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class LoadTodosEvent extends TodoEvent {
  final String userEmail;
  
  LoadTodosEvent({required this.userEmail});
}

class AddTodoEvent extends TodoEvent {
  final Todo todo;
  
  AddTodoEvent({required this.todo});
}

class ToggleTodoEvent extends TodoEvent {
  final String id;
  final String userEmail;
  
  ToggleTodoEvent({required this.id, required this.userEmail});
}

class DeleteTodoEvent extends TodoEvent {
  final String id;
  final String userEmail;
  
  DeleteTodoEvent({required this.id, required this.userEmail});
}

class SearchTodosEvent extends TodoEvent {
  final String query;
  final String userEmail;
  
  SearchTodosEvent({required this.query, required this.userEmail});
}