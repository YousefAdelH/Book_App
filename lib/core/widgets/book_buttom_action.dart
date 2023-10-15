import 'package:flutter/material.dart';

import '../utils/styles.dart';

class ButtomBook extends StatelessWidget {
  const ButtomBook(
      {super.key, required this.title, required this.color, this.borders, required this.onTap});

  final String title;
  final Color color;
  final OutlinedBorder? borders;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 160,
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color, shape: borders),
        onPressed: onTap,

        child: Text(
          textAlign: TextAlign.center,
          title,
          style: Styles.textStyle14
              .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
