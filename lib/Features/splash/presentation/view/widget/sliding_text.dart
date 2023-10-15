import 'package:flutter/material.dart';

class SingleText extends StatelessWidget {
  const SingleText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              'Read Free Books',
              // style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
