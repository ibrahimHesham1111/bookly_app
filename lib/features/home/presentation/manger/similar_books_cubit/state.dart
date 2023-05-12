import '../../../data/models/books_model.dart';

abstract class SimilarBooksState{}

class SimilarBooksInitialState extends SimilarBooksState{}
class SimilarBooksLoadingState extends SimilarBooksState{}
class SimilarBooksSuccessState extends SimilarBooksState{
  final List<BookModel>books;

  SimilarBooksSuccessState(this.books);
}
class SimilarBooksErrorState extends SimilarBooksState{
  final String errMessage;

  SimilarBooksErrorState(this.errMessage);
}