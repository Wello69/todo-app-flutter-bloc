class Todo {
  final String id;
  final String title;
  final String description;
  final DateTime? deadline;
  bool isCompleted;
  final String userEmail;
  
  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.deadline,
    this.isCompleted = false,
    required this.userEmail,
  });
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'deadline': deadline?.millisecondsSinceEpoch,
      'isCompleted': isCompleted ? 1 : 0,
      'userEmail': userEmail,
    };
  }
  
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      deadline: map['deadline'] != null 
          ? DateTime.fromMillisecondsSinceEpoch(map['deadline'])
          : null,
      isCompleted: map['isCompleted'] == 1,
      userEmail: map['userEmail'],
    );
  }
  
  Todo copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? deadline,
    bool? isCompleted,
    String? userEmail,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      isCompleted: isCompleted ?? this.isCompleted,
      userEmail: userEmail ?? this.userEmail,
    );
  }
}