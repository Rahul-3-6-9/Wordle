import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle_flutter/main.dart';
import 'package:wordle_flutter/pages/settings.dart';
import 'package:wordle_flutter/utils/quick_box.dart';
import '../components/grid.dart';
import '../components/keyboard_row.dart';
import 'package:wordle_flutter/providers/word_provider.dart';
import '../providers/controller.dart';
import 'package:wordle_flutter/constants/flag.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _word;
  late List<String> _words;
  @override
  void initState() {
  //  _words = await WordFetcher().fetchWords();
  //  print(_words);
    // final r = Random().nextInt(words.length);
    // _word = _words[r];
    // print(_word);
  WordFetcher().fetchWords().then((result){
    final r = Random().nextInt(result.length);
    _word = result[r];
  }).then((something){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_word.isNotEmpty){
      Provider.of<Controller>(context, listen: false)
          .setCorrectWord(word: _word);
      }
    });
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wordle'),
        centerTitle: true,
        elevation: 0,
        actions: [
          // The Consumer remains to show messages, but no IconButtons
          Consumer<Controller>(
            builder: (_, notifier, __) {
              if (notifier.notEnoughLetters) {
                runQuickBox(context: context, message: 'Not Enough Letters');
              }
              if (notifier.gameCompleted) {
                if (notifier.gameWon) {
                  if (notifier.currentRow == 6) {
                    runQuickBox(context: context, message: 'Phew!');
                  } else {
                    runQuickBox(context: context, message: 'Splendid!');
                  }
                } else {
                  runQuickBox(context: context, message: notifier.correctWord);
                }
                // Optional: You might want to clear the message after a delay
                Future.delayed(
                  const Duration(milliseconds: 4000),
                  () {
                    // Clear or handle logic after displaying the message
                  },
                );
              }
              return Container(); // Placeholder since there are no buttons
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 2,
          ),
          Expanded(flex: 7, child: Grid()),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                KeyboardRow(
                  min: 1,
                  max: 10,
                ),
                KeyboardRow(
                  min: 11,
                  max: 19,
                ),
                KeyboardRow(
                  min: 20,
                  max: 29,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
