import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChalkWord extends StatelessWidget {
  final String word;
  final Set<String> guessed;

  const ChalkWord({
    super.key,
    required this.word,
    required this.guessed,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children: word.split('').map((e) {
        final visible = guessed.contains(e);

        return Text(
          visible ? e.toUpperCase() : "_",
          style: GoogleFonts.gloriaHallelujah(
            fontSize: 42,
            color: Colors.white,
          ),
        );
      }).toList(),
    );
  }
}