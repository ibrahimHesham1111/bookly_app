import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/state.dart';
import 'package:bookly_app/features/home/presentation/manger/newset_books/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates>
{
  NewestBooksCubit(this.homeRepo):super(NewestBooksInitialState());
  static NewestBooksCubit get(context)=>BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void> fetchFNewestBooks()async {
    emit(NewestBooksLoadingState());
    var result= await  homeRepo.fetchNewestBooks();

    result.fold((failure)
    {
      emit(NewestBooksErrorState(failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccessState(books));
    });
  }
}