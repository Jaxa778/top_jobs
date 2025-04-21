import 'package:flutter/material.dart';
import 'package:top_jobs/views/screens/on_boarding_screens/screens/logo_screen.dart';
import 'package:top_jobs/views/screens/register_screens/screens/user_or_admin.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: UserOrAdmin());
  }
}
