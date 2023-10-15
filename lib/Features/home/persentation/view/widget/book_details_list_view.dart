import 'package:book_app/Features/home/persentation/manger/smila_books_cubit/similar_books_cubit.dart';
import 'package:book_app/Features/home/persentation/view/widget/best_seller_list_item.dart';
import 'package:book_app/Features/home/persentation/view/widget/custom_book_image.dart';
import 'package:book_app/Features/home/persentation/view/widget/custom_failure_error.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsListView extends StatelessWidget {
  const BookDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
      builder: (context, state) {
        if(state is SimilarBooksSuccess){
          return
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
              child: ListView.builder(

                itemBuilder: (context, index) {

                  return  CustomBookImage(
                    urlImage: state.books[index].volumeInfo.imageLinks?.thumbnail ?? ''  ,);
                },
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
              ),
            );

        } else if (state is SimilarBooksFailure){
          return CustomFailureError(errormssage: state.errMessage,);
        } else {
          return  const Center(
              child: CircularProgressIndicator());
        }

      },

    );
  }
}
