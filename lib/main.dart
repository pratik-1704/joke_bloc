import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_bloc/data/respository/joke_respository.dart';
import 'package:jokes_bloc/presentation/home/home.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        backgroundColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.grey[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey[900],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: RepositoryProvider(
          create: (BuildContext context) { JokeRepository(); },
          child: const Home()),
    );
  }
}
