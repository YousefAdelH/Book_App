import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/persentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:book_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';


import '../../../data/model/book_model/image_links.dart';
import 'custom_book_image.dart';
import 'custom_failure_error.dart';

class ListBookItem extends StatelessWidget {
  const ListBookItem({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
      builder: (context, state) {
         if(state is FeaturedBooksSuccess){

           return  SizedBox(
             height: MediaQuery.of(context).size.height * 0.3,
             child: ListView.builder(

               itemBuilder: (context, index) {
                 return  GestureDetector (
                   onTap:  (){
                     GoRouter.of(context).push(AppRouter.kBookDetailsView,extra:state.books[index]);
                   }  ,
                   child: CustomBookImage(
                     urlImage: state.books[index].volumeInfo.imageLinks?.thumbnail ?? "https://www.simpleorientedarchitecture.com/book-review-advanced-api-security/"
                          ,
                   ),
                 );
               },
               itemCount: state.books.length,
               scrollDirection: Axis.horizontal,
             ),
           );
         }
         else if (state is FeaturedBooksFailure){
           return CustomFailureError(errormssage: state.errMessage,);
         } else {
           return  const Center(
               child: CircularProgressIndicator());
         }

      },

    );
  }
}
