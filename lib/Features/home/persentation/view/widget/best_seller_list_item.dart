import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/persentation/view/widget/book_rating.dart';
import 'package:book_app/Features/home/persentation/view/widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:book_app/core/utils/assets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BestSellerItemList extends StatelessWidget {
  const BestSellerItemList({super.key,required this.books});
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            height: 160,
            width: 100,
            child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: CustomBookImage(
                urlImage: books.volumeInfo.imageLinks?.thumbnail ?? 'data:image/jpeg;base64,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',)
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    books.volumeInfo.title ?? 'null',
                    style: Styles.textStyle20,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  books.volumeInfo.authors![0],
                  style: Styles.textStyle16,
                ),
                Row(children: [
                  const Text(
                    'free',
                    style: Styles.textStyle20,
                  ),
                  const Spacer(),
                  BookRating(
                    averageRate:books.volumeInfo.averageRating ?? 0,
                  rate: books.volumeInfo.ratingsCount ?? '(0.0)',
                  )
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
