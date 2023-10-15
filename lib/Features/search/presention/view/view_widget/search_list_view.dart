import 'package:book_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:book_app/Features/search/presention/manger/search_book_cubit/search_book_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/api_sevice.dart';
import '../../../../home/persentation/view/widget/best_seller_list_item.dart';
import '../../../../home/persentation/view/widget/custom_failure_error.dart';

class SearchedListView extends StatelessWidget {
  const SearchedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(

      builder:

     (context, state) {
      if (state is SearchBooksSuccess) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount:10,
          // state.books.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.deepOrange,
            );
            //   Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10),
            //   child: BestSellerItemList(
            //     books: state.books[index],
            //   ),
            // );
          },
        );
      } else if (state is SearchBooksFailure) {
        return CustomFailureError(errormssage: state.errMessage);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },

    );



  }
}
