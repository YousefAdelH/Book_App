import 'package:book_app/Features/home/persentation/manger/newest_books_cubit/newset_books_cubit.dart';
import 'package:book_app/Features/home/persentation/view/widget/best_seller_list_item.dart';
import 'package:book_app/Features/home/persentation/view/widget/custom_failure_error.dart';
import 'package:book_app/core/utils/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit,NewsetBooksState>(
      builder: ( context,  state) {
        if(state is NewsetBooksSuccess){
        return ListView.builder(


          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kBookDetailsView,extra:state.books[index]);
                },
                child:
                BestSellerItemList(books:state.books[index]  ));
          },
          itemCount: 10,
        );}
        else if (state is NewsetBooksFailure){
          return CustomFailureError(errormssage: state.errMessage,);
        } else {
          return  const Center(
              child: CircularProgressIndicator());
        }
      },

    );
  }
}
