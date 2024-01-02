// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:random_users_app_with_api/models/user.dart';
import 'package:random_users_app_with_api/services/user_api.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await UserApi().fetchUsers();
    setState(() {
      users = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api Call'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];
          final color = user.gender == 'male'
              ? const Color.fromARGB(255, 7, 53, 169)
              : const Color.fromARGB(255, 100, 4, 102);
          return ListTile(
            tileColor: color,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(user.picture.thumbnail),
            ),
            title: Text(user.fullName),
            subtitle: Text(user.location.street.name),
            trailing: Text(
              user.dob.age.toString(),
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          );
        },
      ),
    );
  }
}
