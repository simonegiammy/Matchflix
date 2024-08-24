import 'package:flutter/material.dart';

class SwipeCards extends StatefulWidget {
  final List<Widget> cards;
  const SwipeCards({super.key, required this.cards});

  @override
  State<SwipeCards> createState() => _SwipeCardsState();
}

class _SwipeCardsState extends State<SwipeCards> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = widget.cards.length - 1; i >= 0; i--)
          Transform.scale(
              scale: 1 - i * 0.05,
              child: Dismissible(key: ValueKey(i), child: widget.cards[i]))
      ],
    );
  }
}
