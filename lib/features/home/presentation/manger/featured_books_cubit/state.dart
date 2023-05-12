import '../../../data/models/books_model.dart';

abstract class FeaturedBooksStates{}

class FeaturedBookInitialState extends FeaturedBooksStates{}
class FeaturedBookLoadingState extends FeaturedBooksStates{}
class FeaturedBookSuccessState extends FeaturedBooksStates{
  final List<BookModel>books;

   FeaturedBookSuccessState(this.books);
}
class FeaturedBookErrorState extends FeaturedBooksStates{
  final String errorMessage;

   FeaturedBookErrorState(this.errorMessage);
}