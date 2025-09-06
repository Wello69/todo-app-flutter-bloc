part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodosLoaded extends TodoState {
  final List<Todo> todos;
  
  TodosLoaded({required this.todos});
}

class TodoError extends TodoState {
  final String message;
  
  TodoError({required this.message});
}

class TodoOperationSuccess extends TodoState {}