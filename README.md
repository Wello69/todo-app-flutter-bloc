# Todo App - Flutter & BLoC
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/Wello69/todo-app-flutter-bloc)

A simple and responsive Todo application built with Flutter, demonstrating state management using the BLoC (Business Logic Component) pattern. The app allows users to manage their tasks with features like adding, deleting, searching, and marking todos as complete. User sessions are managed locally to ensure a personalized experience.

## Features

-   **User Session Management**: A simple login system that persists the user's email using `shared_preferences`.
-   **CRUD Operations for Todos**: Create, read, update (toggle completion), and delete todos.
-   **User-Specific Todos**: All todos are associated with the logged-in user's email.
-   **Search Functionality**: Instantly filter and search through your todo list.
-   **Deadline Support**: Add an optional deadline to your todos.
-   **Clean Architecture**: State management is handled cleanly by the BLoC pattern, separating UI from business logic.

## Technical Stack

-   **Framework**: [Flutter](https://flutter.dev/)
-   **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
-   **Local Storage**: [shared_preferences](https://pub.dev/packages/shared_preferences) for session and todo persistence.
-   **Value Equality**: [equatable](https://pub.dev/packages/equatable) to simplify BLoC state comparisons.

## Project Structure

The project is organized into logical directories to maintain a clean and scalable codebase.

```
lib/
├── blocs/
│   ├── auth_bloc/      # Manages authentication state (login, logout)
│   └── todo_bloc/      # Manages state for all todo operations (load, add, delete, etc.)
├── models/
│   ├── todo.dart       # Data model for a Todo item
│   └── user.dart       # Data model for a User
├── screens/
│   ├── add_todo_screen.dart    # UI for adding a new todo
│   ├── login_screen.dart       # UI for user login
│   └── todo_list_screen.dart   # Main screen displaying the list of todos
├── services/
│   └── shared_prefs_service.dart # Service for interacting with SharedPreferences
└── widgets/
    ├── search_bar.dart  # Reusable search bar widget
    └── todo_item.dart   # Reusable widget for displaying a single todo
```

-   **`blocs`**: Contains all the Business Logic Components.
    -   `AuthBloc`: Handles user authentication logic. It processes `LoginEvent`, `LogoutEvent`, and `CheckAuthStatusEvent`, emitting states like `Authenticated` and `Unauthenticated`.
    -   `TodoBloc`: Manages the state of the todo list. It responds to events like `LoadTodosEvent`, `AddTodoEvent`, and `SearchTodosEvent` to manipulate and provide the list of todos to the UI.
-   **`models`**: Defines the data structures (`Todo`, `User`) used throughout the application.
-   **`screens`**: Contains the widgets that represent the different screens of the app.
-   **`services`**: Includes services that interact with external sources or provide utilities, such as `SharedPrefsService` for data persistence.
-   **`widgets`**: Holds reusable UI components that are used across multiple screens, like `TodoItem` and `SearchBar`.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

-   [Flutter SDK](https://docs.flutter.dev/get-started/install) installed on your machine.

### Installation & Running

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/wello69/todo-app-flutter-bloc.git
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd todo-app-flutter-bloc
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the app:**
    ```sh
    flutter run
