import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates>
{
  FeaturedBooksCubit(this.homeRepo):super(FeaturedBookInitialState());
  static FeaturedBooksCubit get(context)=>BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks()async {
    emit(FeaturedBookLoadingState());
   var result= await  homeRepo.fetchFeaturedBooks();

   result.fold((failure)
   {
     emit(FeaturedBookErrorState(failure.errMessage));
   }, (books) {
     emit(FeaturedBookSuccessState(books));
   });
  }
}