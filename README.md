# ✅ Todo App - Flutter & BLoC

A simple, responsive **Todo application** built with **Flutter**, leveraging the **BLoC (Business Logic Component)** pattern for robust state management.  
This app empowers users to manage their tasks efficiently with features like adding, deleting, searching, and marking todos as complete.  

User sessions are persisted locally using **SharedPreferences**, ensuring a personalized experience across sessions.  
Designed with **Clean Architecture**, it separates UI from business logic, making the app **scalable** and **maintainable**.

---

## 🚀 Features
- **User Session Management**: Seamless login system that saves the user's email locally with SharedPreferences.  
- **CRUD Operations**: Create, Read, Update (toggle completion), and Delete todos.  
- **User-Specific Todos**: Tasks are tied to the logged-in user's email for privacy and organization.  
- **Search Functionality**: Instantly filter todos by title or description.  
- **Deadline Support**: Add optional deadlines to todos (e.g., *"Finish report by 10/10/2025"*).  
- **Clean Architecture**: Decouples UI from business logic for reusability and testability.  

---

## 🛠️ Technical Stack
- **Framework**: [Flutter](https://flutter.dev/)  
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)  
- **Local Storage**: [shared_preferences](https://pub.dev/packages/shared_preferences)  
- **Value Equality**: [equatable](https://pub.dev/packages/equatable)  
- **Annotations**: [meta](https://pub.dev/packages/meta)  

---

## 📂 Project Structure
lib/
├── blocs/
│ ├── auth_bloc/ # Handles authentication state (login, logout, status)
│ │ ├── auth_bloc.dart
│ │ ├── auth_event.dart
│ │ └── auth_state.dart
│ └── todo_bloc/ # Handles todo state (load, add, delete, search)
│ ├── todo_bloc.dart
│ ├── todo_event.dart
│ └── todo_state.dart
├── models/
│ ├── todo.dart # Todo model (id, title, description, etc.)
│ └── user.dart # User model (email)
├── screens/
│ ├── add_todo_screen.dart # Add new todos with form fields
│ ├── login_screen.dart # Login screen with email input
│ └── todo_list_screen.dart# Main todo list screen
├── services/
│ └── shared_prefs_service.dart # Handles SharedPreferences operations
└── widgets/
├── search_bar.dart # Reusable search bar
└── todo_item.dart # Widget for displaying todo items

markdown
Copy code

---

## 🔄 Blocs Overview
- **AuthBloc**  
  - Handles authentication lifecycle.  
  - Events: `LoginEvent`, `LogoutEvent`, `CheckAuthStatusEvent`.  
  - States: `Authenticated`, `Unauthenticated`.  

- **TodoBloc**  
  - Manages the todo list.  
  - Events: `LoadTodosEvent`, `AddTodoEvent`, `ToggleTodoEvent`, `DeleteTodoEvent`, `SearchTodosEvent`.  
  - States update the todo list accordingly.  

---

## ▶️ Getting Started

### Prerequisites
- Install [Flutter SDK](https://flutter.dev/docs/get-started/install).  
- Ensure **Git** is installed (`git --version`).  

### Installation
```bash
# 1. Clone the repository
git clone https://github.com/Wello69/todo-app-flutter-bloc.git

# 2. Navigate to project
cd todo-app-flutter-bloc

# 3. Install dependencies
flutter pub get

# 4. Run the app
flutter run
👉 Make sure you have a connected device/emulator before running.

Troubleshooting
Run flutter doctor to check environment.

If issues persist, clear cache:

bash
Copy code
flutter clean
flutter pub get
🤝 Contributing
Fork the repository.

Create a new branch (git checkout -b feature/your-feature).

Commit your changes (git commit -m 'Add some feature').

Push to the branch (git push origin feature/your-feature).

Open a Pull Request.

📜 License
This project is licensed under the MIT License - see the LICENSE file for details.

📩 Contact
For questions or collaboration:
📧 wello6668@gmail.com
Or open an issue on GitHub.
