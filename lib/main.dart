import 'package:flutter/material.dart';
import 'package:write_it/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Write it',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            // color: Color.fromARGB(255, 211, 240, 209),
            color: Color.fromARGB(255, 254, 253, 237),
          ),
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromARGB(255, 254, 253, 237)),
      home: const HomePage(),
    );
  }
}
