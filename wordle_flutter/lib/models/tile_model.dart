import 'package:wordle_flutter/constants/answer_stages.dart';

class TileModel {

  final String letter;
  AnswerStage answerStage;

  TileModel({required this.letter, required this.answerStage});

}