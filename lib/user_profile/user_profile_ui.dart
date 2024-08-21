import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_user_generator/user_profile/user_profile_ctrl.dart';
import '../classes/user_class.dart';

class ProfileUser2 extends StatelessWidget {
  const ProfileUser2({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final UserProfileCtrl userCtrl = Get.put(UserProfileCtrl());

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Random User Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<User>(
              future: userCtrl.futureUser,
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
            ElevatedButton(
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
          ],
        ),
      ),
    );
  }
}
