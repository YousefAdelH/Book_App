import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/persentation/view/widget/app_bar_book_details.dart';
import 'package:book_app/Features/home/persentation/view/widget/book_Action.dart';
import 'package:book_app/Features/home/persentation/view/widget/book_rating.dart';
import 'package:book_app/Features/home/persentation/view/widget/custom_book_image.dart';
import 'package:book_app/Features/home/persentation/view/widget/similar_books_section.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class BookDetailsBodyView extends StatelessWidget {
  const BookDetailsBodyView({super.key, required this.books});
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.17),
                child:
                CustomBookImage(urlImage:
                books.volumeInfo.imageLinks!.thumbnail ?? 'null'),
              ),
               Text(
                books.volumeInfo.title ?? 'null',
                style: Styles.textStyle20,
                 textAlign:TextAlign.center ,
              ),
              const SizedBox(
                height: 4,
              ),
               Opacity(
                opacity: 0.5,
                child: Text( books.volumeInfo.publisher ?? 'null', style: Styles.textStyle14),
              ),
              const SizedBox(
                height: 4,
              ),
               BookRating(
                rate: books.volumeInfo.ratingsCount ?? '0.0',
                averageRate:  books.volumeInfo.averageRating ?? 0,
              ),
              const SizedBox(
                height: 15,
              ),
               Center(child:
              BookAction(books: books,)),
              const Expanded(
                  child: SizedBox(
                height: 50,
              )),
              const SimilarBooksSection()
            ],
          ),
        )
      ],
    );
  }
}
