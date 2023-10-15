// import 'package:book_app/Features/search/presention/manger/search_book_cubit/search_book_cubit.dart';
// import 'package:book_app/Features/search/presention/view/view_widget/custom_search_book.dart';
// import 'package:book_app/core/utils/api_sevice.dart';
// import 'package:book_app/core/utils/styles.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../home/data/repos/home_repo_impl.dart';
// import '../../../home/persentation/view/widget/custom_failure_error.dart';
//
// class SearchView extends StatefulWidget {
//   const SearchView({super.key});
//
//   @override
//   State<SearchView> createState() => _SearchViewState();
// }
//
// class _SearchViewState extends State<SearchView> {
//   final _textController = TextEditingController();
//
//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }
//   @override
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: TextField(
//               controller: _textController,
//               style: Styles.textStyle14.copyWith(color: Colors.black),
//               decoration: InputDecoration(
//
//                 fillColor: Colors.white,
//
//                 border: InputBorder.none,
//                 hintText: 'Search Users',
//                 filled: true,
//                 suffix: IconButton(
//                   icon: const Icon(Icons.clear,color: Colors.black,),
//                   onPressed: () {
//                     context.read<SearchBooksCubit>().clearSearch();
//                     _textController.clear();
//                   },
//                 ),
//               ),
//               textInputAction:TextInputAction.done,
//               textAlignVertical: TextAlignVertical.center,
//               onSubmitted: (value) {
//                 if (value.isNotEmpty) {
//                   // BlocProvider.of<SearchBooksCubit>(context).searchBooks(query: value.trim() ??);
//                   context.read<SearchBooksCubit>().searchBooks(query: value.trim());
//                 }
//               }
//           )
//
//       ),
//       body: BlocConsumer<SearchBooksCubit,SearchBooksState>(
//         listener: (context, state) {
//
//         },
//         builder: (context, state) {
//           if(state is SearchBooksSuccess){
//
//             return SizedBox(
//               height: MediaQuery.of(context).size.height * 0.20,
//               child: ListView.builder(
//                 itemCount: state.books.length,
//                 scrollDirection: Axis.vertical,
//                 itemBuilder:(context, index) {
//                   Container(
//                       color:Colors.cyan
//                   );
//                   //CustomSearchBook();
//                 },     ),
//             );
//           }else if (state is SearchBooksFailure){
//             return CustomFailureError(errormssage: state.errMessage,);
//           } else {
//             return  const Center(
//                 child: CircularProgressIndicator());
//           }
//         },
//
//       ),
//
//     );
//   }
// }
