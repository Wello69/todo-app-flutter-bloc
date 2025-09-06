# Todo App - Flutter & BLoC

A simple, responsive Todo application built with Flutter, leveraging the BLoC (Business Logic Component) pattern for robust state management. This app empowers users to manage their tasks efficiently with features like adding, deleting, searching, and marking todos as complete. User sessions are persisted locally using SharedPreferences, ensuring a personalized experience across sessions. Designed with Clean Architecture, it separates UI from business logic, making it scalable and maintainable.

## Features
- **User Session Management**: A seamless login system that saves the user's email locally with SharedPreferences, allowing quick access on app restart.
- **CRUD Operations for Todos**: Create new tasks, read your todo list, update (toggle completion), and delete todos with ease.
- **User-Specific Todos**: Each task is tied to the logged-in user's email, ensuring privacy and organization.
- **Search Functionality**: Filter your todo list instantly by title or description using a custom search bar.
- **Deadline Support**: Add optional deadlines to todos (e.g., "Finish report by 10/10/2025") for better time management.
- **Clean Architecture**: Utilizes the BLoC pattern to decouple the UI from business logic, enhancing code reusability and testability.

## Technical Stack
- **Framework**: Flutter for cross-platform development.
- **State Management**: flutter_bloc for reactive state handling.
- **Local Storage**: shared_preferences for persisting user sessions and todos.
- **Value Equality**: equatable for efficient state comparisons in BLoC.
- **Metadata**: meta for type safety and annotations.

## Project Structure
The codebase is organized into logical directories for scalability and clarity:
lib/
├── blocs/
│   ├── auth_bloc/      # Manages authentication state (login, logout, check status)
│   │   ├── auth_bloc.dart
│   │   ├── auth_event.dart
│   │   └── auth_state.dart
│   └── todo_bloc/      # Manages todo list state (load, add, delete, search)
│       ├── todo_bloc.dart
│       ├── todo_event.dart
│       └── todo_state.dart
├── models/
│   ├── todo.dart       # Defines the Todo data model with id, title, description, etc.
│   └── user.dart       # Defines the User model with email
├── screens/
│   ├── add_todo_screen.dart    # Screen for adding new todos with form fields
│   ├── login_screen.dart       # Login screen with email input
│   └── todo_list_screen.dart   # Main screen showing the todo list
├── services/
│   └── shared_prefs_service.dart # Service to handle SharedPreferences operations
└── widgets/
├── search_bar.dart  # Reusable search bar widget
└── todo_item.dart   # Reusable widget for individual todo items
text### Blocs Overview
- **AuthBloc**: Handles user authentication lifecycle. Responds to `LoginEvent`, `LogoutEvent`, and `CheckAuthStatusEvent`, emitting states like `Authenticated` or `Unauthenticated`.
- **TodoBloc**: Manages the todo list. Processes events like `LoadTodosEvent`, `AddTodoEvent`, `ToggleTodoEvent`, `DeleteTodoEvent`, and `SearchTodosEvent` to update and display the todo list.

### Getting Started
To run this project locally, follow these steps:

#### Prerequisites
- Install the [Flutter SDK](https://flutter.dev/docs/get-started/install) on your machine.
- Ensure you have Git installed (`git --version` to check).

#### Installation & Running
1. Clone the repository:
git clone https://github.com/wello69/todo-app-flutter-bloc.git
text2. Navigate to the project directory:
cd todo-app-flutter-bloc
text3. Install dependencies:
flutter pub get
text4. Run the app:
flutter run
text- Connect a device or emulator to see the app in action.

#### Troubleshooting
- If you encounter errors, ensure your Flutter environment is set up (`flutter doctor`).
- Clear the cache with `flutter clean` and re-run `flutter pub get` if needed.

## Contributing
Feel free to fork this repository, submit pull requests, or open issues for bugs and enhancements. Let's make this Todo app even better!

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact
For questions or collaboration, reach out to [your-email@example.com](mailto:your-email@example.com) or open an issue on GitHub.
