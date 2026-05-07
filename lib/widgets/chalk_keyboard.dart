import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChalkKeyboard extends StatelessWidget {
  final Function(String) onTap;
  final Set<String> selected;

  ChalkKeyboard({
    super.key,
    required this.onTap,
    required this.selected,
  });

  final letters = [
    "A","B","C","Ç","D","E","F","G","Ğ",
    "H","I","İ","J","K","L","M","N","O",
    "Ö","P","R","S","Ş","T","U","Ü","V",
    "Y","Z"
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: letters.map((e) {
        final used = selected.contains(e.toLowerCase());

        return GestureDetector(
          onTap: used ? null : () => onTap(e.toLowerCase()),
          child: Text(
            used ? "$e̶" : e,
            style: GoogleFonts.gloriaHallelujah(
              fontSize: 24,
              color: used ? Colors.redAccent : Colors.white,
            ),
          ),
        );
      }).toList(),
    );
  }
}