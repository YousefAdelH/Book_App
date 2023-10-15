import 'package:book_app/Features/home/data/repos/home_repo.dart';
import 'package:book_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:book_app/Features/home/persentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/core/utils/services_lacator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:google_fonts/google_fonts.dart';

import 'Features/home/persentation/manger/newest_books_cubit/newset_books_cubit.dart';
import 'Features/search/presention/manger/search_book_cubit/search_book_cubit.dart';
import 'Features/splash/presentation/view/splash_view.dart';
import 'core/utils/api_sevice.dart';
import 'core/utils/app_router.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(HomeRepoimpl(ApiService(Dio())))
          //
          //
          // FeaturedBooksCubit(
          //   getIt.get<HomeRepoimpl>(),
          // )..fetchFeaturedBBooks(),
        ),
        BlocProvider(
          create: (context) => NewsetBooksCubit(
              HomeRepoimpl(ApiService(Dio()))
          ),
        ),
        BlocProvider(create:   (context) => SearchBooksCubit(
          HomeRepoimpl(ApiService(Dio()))
    ),)
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color(0xff100B20),
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
