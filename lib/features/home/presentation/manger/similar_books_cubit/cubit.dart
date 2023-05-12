import 'package:bookly_app/features/home/presentation/manger/similar_books_cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState>{


  SimilarBooksCubit(this.homeRepo, ):super(SimilarBooksInitialState());

static  SimilarBooksCubit get(context)=>BlocProvider.of(context);

  final HomeRepo homeRepo;


  Future<void> fetchFSimilarBooks({ required String category})async {
    emit(SimilarBooksLoadingState());
    var result= await  homeRepo.fetchSimilarBooks(category: category);

    result.fold((failure)
    {
      emit(SimilarBooksErrorState(failure.errMessage));
    }, (books) {
      emit(SimilarBooksSuccessState(books));
    });
  }

}