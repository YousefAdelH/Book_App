import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../home/persentation/view/widget/book_Action.dart';
import '../../../../home/persentation/view/widget/book_rating.dart';
import '../../../../home/persentation/view/widget/custom_book_image.dart';

class CustomSearchBook extends StatelessWidget {
  const CustomSearchBook({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        CustomBookImage(urlImage: 'https://picsum.photos/250?image=9'
          //books.volumeInfo.imageLinks!.thumbnail ?? 'null'),
        ),
        Text(
         // books.volumeInfo.title ?? 'null',
          'book name',
          style: Styles.textStyle20,
          textAlign:TextAlign.center ,
        ),
        SizedBox(
          height: 4,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
             // books.volumeInfo.publisher ?? 'null',
              'book publisher',
              style: Styles.textStyle14),
        ),
        SizedBox(
          height: 4,
        ),
        BookRating(
          rate: 00,
        //  books.volumeInfo.ratingsCount ?? '0.0',
          averageRate:  00,
         // books.volumeInfo.averageRating ?? 0,
        ),


      ],
    );
  }
}
