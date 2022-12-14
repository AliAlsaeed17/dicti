import 'package:dicti/bloc/word_search_cubit.dart';
import 'package:dicti/repo/word_repo.dart';
import 'package:dicti/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicti Dictionary',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (BuildContext context) => WordSearchCubit(WordRepository()),
        child: HomeScreen(),
      ),
    );
  }
}
