import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart'; // Add this import if you use GetX for routing
import 'package:random_user_generator/main.dart';
import 'package:random_user_generator/profile.dart/ui_user_profile.dart';
import 'package:random_user_generator/user_profile/user_profile_ui.dart'; // Import the profile screens

void main() {
  testWidgets('Navigation and button interaction test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify initial state.
    expect(find.text(' API Integration\n(https://randomuser.me)\n and \nState Management \n(Default and Getx)'), findsOneWidget);

    // Verify buttons are present.
    expect(find.text('Fetch and display using default state management'), findsOneWidget);
    expect(find.text('Fetch and display using getx'), findsOneWidget);

    // Tap the first button and verify navigation to ProfileUser1.
    await tester.tap(find.text('Fetch and display using default state management'));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify that ProfileUser1 screen is displayed.
    expect(find.byType(ProfileUser1), findsOneWidget);

    // Navigate back to the home screen.
    Get.back();
    await tester.pumpAndSettle();

    // Tap the second button and verify navigation to ProfileUser2.
    await tester.tap(find.text('Fetch and display using getx'));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify that ProfileUser2 screen is displayed.
    expect(find.byType(ProfileUser2), findsOneWidget);
  });
}
