import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manger/similar_books_cubit/cubit.dart';
import 'package:bookly_app/features/home/presentation/manger/similar_books_cubit/state.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
      builder: (context,state){
        if(state is SimilarBooksSuccessState){
          return SizedBox(
            height: MediaQuery.of(context).size.height *.15,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return   CustomBookImage(
                  imageUrl: state.books[index].volumeInfo.imageLinks?.smallThumbnail??'',
                );
              },
              itemCount: state.books.length,
            ),
          );
        }else if(state is SimilarBooksErrorState){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else{
          return const CustomLoadingIndicator();
        }
      },

    );
  }
}