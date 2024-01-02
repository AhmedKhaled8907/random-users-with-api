class UserDob {
  final DateTime date;
  final int age;

  UserDob({
    required this.date,
    required this.age,
  });

  factory UserDob.fromMap(Map<String, dynamic> json) {
    final date = json['date'];
    return UserDob(
      age: json['age'],
      date: DateTime.parse(date),
    );
  }
}
