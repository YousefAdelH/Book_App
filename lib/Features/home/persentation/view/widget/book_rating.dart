import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,required this.rate,required this.averageRate
  });
final dynamic rate;
final int averageRate;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        FontAwesomeIcons.solidStar,
        color: Colors.yellow,
        size: 10,
      ),
      SizedBox(
        width: 5,
      ),
      Text(

        rate.toString(),
        style: Styles.textStyle14,
      ),
      SizedBox(
        width: 5,
      ),
      Opacity(
        opacity: 0.7,
        child: Text(

            averageRate.toString() , style: Styles.textStyle14.copyWith(fontSize: 10)),
      ),
    ]);
  }
}
