class UserName {
  final String title, first, last;

  UserName({
    required this.title,
    required this.first,
    required this.last,
  });

  factory UserName.fromMap(Map<String, dynamic> e) {
    return UserName(
      title: e['name']['title'],
      first: e['name']['first'],
      last: e['name']['last'],
    );
  }
}
