// ignore_for_file: library_private_types_in_public_api

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:random_user_generator/request_handler.dart';
import '../classes/user_class.dart';

class ProfileUser1 extends StatelessWidget {
  const ProfileUser1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random User Generator'),
      ),
      body: const RandomUserScreen(), // Use as a child widget, not as a new MaterialApp
    );
  }
}

class RandomUserScreen extends StatefulWidget {
  const RandomUserScreen({super.key});

  @override
  _RandomUserScreenState createState() => _RandomUserScreenState();
}

class _RandomUserScreenState extends State<RandomUserScreen> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchRandomUser();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FutureBuilder<User>(
            future: futureUser,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlipInY(
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data!.pictureUrl),
                        radius: 50,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SlideInLeft(
                      child: Text(snapshot.data!.name,
                          style: const TextStyle(fontSize: 24)),
                    ),
                    const SizedBox(height: 10),
                       SlideInLeft(
                        delay: const Duration(milliseconds: 200),
                      child: Text(snapshot.data!.email,
                          style: const TextStyle(fontSize: 18)),
                    ),
                  ],
                );
              } else {
                return const Text("No data");
              }
            },
          ),
          const SizedBox(height: 8),
          FadeIn(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 49, 49, 49)),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                ),
              ),
              child: const Text('Back'),
            ),
          ),
        ],
      ),
    );
  }
}
