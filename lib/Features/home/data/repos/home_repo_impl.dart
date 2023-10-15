import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/data/repos/home_repo.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/api_sevice.dart';

class HomeRepoimpl implements HomeRepo{
  final ApiService apiService;

  HomeRepoimpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{

    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&q=subject:Programming');
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async{
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=newest &q=medicine');
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async {

      try {
        var data = await apiService.get(
            endPoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance &q=medicine');
        List<BookModel> books = [];
        for (var item in data['items']) {
          try {
            books.add(BookModel.fromJson(item));
          } catch (e) {
            books.add(BookModel.fromJson(item));
          }
        }

        return right(books);
      } catch (e) {
        if (e is DioError) {
          return left(
            ServerFailure.fromDioError(e),
          );
        }
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }

  @override
  Future<Either<Failure, List<BookModel>>> searchFeaturedBook( {required String query}) async {
    try {
      var data = await apiService.get(
          endPoint:
         ' volumes?Filtering=partial&q=$query');

      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }

  }
  }



