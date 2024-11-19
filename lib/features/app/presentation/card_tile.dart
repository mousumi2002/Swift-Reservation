import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  const CardTile({super.key, required this.title, required this.onPressed, required this.cardColor});
  final String title;
  final VoidCallback onPressed;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          color: cardColor,
          child: Center(child: Text(title, style: const TextStyle(color: Colors.black87, fontSize: 18),)),
        ),
      ),
    );
  }
}
