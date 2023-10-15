import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';



abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks();

  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category});
  Future<Either<Failure, List<BookModel>>> searchFeaturedBook({required String query});
  
}