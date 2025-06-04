import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fjkdfiywpxnpykfhhwkt.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqa2RmaXl3cHhucHlrZmhod2t0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDkwMzA5OTAsImV4cCI6MjA2NDYwNjk5MH0.ORehlWO19DHUwqUM_V4XOebTP4IXJlkhbb8XwAxs7RY',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData.dark(),
      home: const AuthGate(),
    );
  }
}
