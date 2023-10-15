import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/core/utils/services_lacator.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/function/launch_url.dart';
import '../../../../../core/widgets/book_buttom_action.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.books});
final BookModel books;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtomBook(

          title: 'Free',
          color: CupertinoColors.white,
          borders: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          onTap: () {

          },
        ),
        ButtomBook(

          title: "preview"
         , color: Colors.orange,
          borders: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(13),
                  bottomRight: Radius.circular(13))),
          onTap: () {
            launchCustomUr(context,books.volumeInfo.previewLink);
          },
        ),
      ],
    );
  }
}
String getIt (BookModel books){
  if (books.volumeInfo.previewLink ==null){
    return 'Not Avaliable';
  }else {
    return 'Preview';
  }
}
