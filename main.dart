import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_logic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameLogic(),
      child: MaterialApp(
        title: 'Wordle Clone',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GameScreen(),
      ),
    );
  }
}