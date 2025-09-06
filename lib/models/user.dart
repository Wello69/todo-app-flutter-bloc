class User {
  final String email;
  
  User({required this.email});
  
  Map<String, dynamic> toMap() {
    return {'email': email};
  }
  
  factory User.fromMap(Map<String, dynamic> map) {
    return User(email: map['email']);
  }
}