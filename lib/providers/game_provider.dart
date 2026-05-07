import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameProvider extends ChangeNotifier {
  String currentWord = "";
  Set<String> guessedLetters = {};
  int mistakes = 0;

  bool get gameOver => mistakes >= 6;
  bool get won =>
      currentWord.isNotEmpty &&
      currentWord.split('').every((e) => guessedLetters.contains(e));

  Future<void> startGame() async {
    guessedLetters.clear();
    mistakes = 0;

    final raw = await rootBundle.loadString('assets/words/tr_words.txt');

    final words = raw
        .split('\n')
        .map((e) => e.trim().toLowerCase())
        .where((e) => e.length >= 4)
        .toList();

    words.shuffle(Random());

    currentWord = words.first;

    notifyListeners();
  }

  void guess(String letter) {
    if (guessedLetters.contains(letter)) return;

    guessedLetters.add(letter);

    if (!currentWord.contains(letter)) {
      mistakes++;
    }

    notifyListeners();
  }
}