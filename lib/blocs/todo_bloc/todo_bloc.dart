import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../services/todo_repository.dart';
import '../../models/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;
  
  TodoBloc({required this.todoRepository}) : super(TodoInitial()) {
    on<LoadTodosEvent>(_onLoadTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<ToggleTodoEvent>(_onToggleTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
    on<SearchTodosEvent>(_onSearchTodos);
  }
  
  void _onLoadTodos(LoadTodosEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final todos = await todoRepository.getTodos(event.userEmail);
      emit(TodosLoaded(todos: todos));
    } catch (e) {
      emit(TodoError(message: 'Failed to load todos'));
    }
  }
  
  void _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      await todoRepository.saveTodo(event.todo);
      emit(TodoOperationSuccess());
    } catch (e) {
      emit(TodoError(message: 'Failed to add todo'));
    }
  }
  
  void _onToggleTodo(ToggleTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await todoRepository.toggleTodoStatus(event.id, event.userEmail);
      add(LoadTodosEvent(userEmail: event.userEmail));
    } catch (e) {
      emit(TodoError(message: 'Failed to toggle todo'));
    }
  }
  
  void _onDeleteTodo(DeleteTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await todoRepository.deleteTodo(event.id, event.userEmail);
      add(LoadTodosEvent(userEmail: event.userEmail));
    } catch (e) {
      emit(TodoError(message: 'Failed to delete todo'));
    }
  }
  
  void _onSearchTodos(SearchTodosEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final todos = await todoRepository.searchTodos(event.query, event.userEmail);
      emit(TodosLoaded(todos: todos));
    } catch (e) {
      emit(TodoError(message: 'Search failed'));
    }
  }
}