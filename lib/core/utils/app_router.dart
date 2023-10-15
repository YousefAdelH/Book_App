import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:book_app/Features/home/persentation/manger/smila_books_cubit/similar_books_cubit.dart';
import 'package:book_app/Features/search/presention/view/search_view.dart';
import 'package:book_app/core/utils/api_sevice.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home/persentation/view/home_view.dart';
import '../../Features/home/persentation/view/widget/book_details_body_view.dart';
import '../../Features/home/persentation/view/widget/book_details_view.dart';
import '../../Features/search/presention/view/view_widget/search_view_body.dart';
import '../../Features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeView';
  static const kBookDetailsView = '/BookDetailsView';
  static const kSearchView = '/SearchView';


  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(
        HomeRepoimpl(ApiService(Dio()))
        ),
        child:  BookDetailsView(
           bookModel: state.extra as BookModel,
        ),
      ),
    ),
  GoRoute(
  path: kSearchView,
  builder: (context, state) => const Searching()),

  ]);
}
