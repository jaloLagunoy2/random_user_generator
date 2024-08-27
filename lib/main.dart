import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:random_user_generator/profile.dart/ui_user_profile.dart';
import 'package:random_user_generator/request_handler.dart';
import 'package:random_user_generator/user_profile/user_profile_ui.dart';
import 'package:random_user_generator/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Dev-Note: To use Getx change MaterialApp to GetMaterialApp
    return GetMaterialApp(
      title: 'REST API Integration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        // useMaterial3: true,
      ),
      home: const MyHomePage(title: 'REST API Integration:'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title, style: const TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              ' API Integration\n(https://randomuser.me)\n and \nState Management \n(Default and Getx)',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileUser1()),
                );
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
              child: const Text(
                  'Fetch and display using default state management'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                Get.to(() => const ProfileUser2());
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
              child: const Text('Fetch and display using getx'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                  Clipboard.setData(const ClipboardData(text: gitRepoLink)); // Copies the text to clipboard
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Copied to Clipboard!')),
        );
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
              child: const Text('Copy Git Repository'),
            ),
            const SizedBox(height: 8),
            const Text(
              'This demo uses:\n'     
              'Flutter 3.4.3 08/21/2024\n'     
              '- http: ^1.2.2\n'
              '- get: ^4.6.6\n'
              '- animate_do: ^3.3.4\n',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
