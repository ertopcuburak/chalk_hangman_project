import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import '../widgets/chalk_keyboard.dart';
import '../widgets/chalk_word.dart';
import '../widgets/hangman_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<GameProvider>().startGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1B1B1B),
              Color(0xFF101010),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),

              Text(
                "ADAM ASMACA",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              SizedBox(
                height: 320,
                child: CustomPaint(
                  painter: HangmanPainter(game.mistakes),
                ),
              ),

              ChalkWord(
                word: game.currentWord,
                guessed: game.guessedLetters,
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.all(16),
                child: ChalkKeyboard(
                  selected: game.guessedLetters,
                  onTap: game.guess,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}