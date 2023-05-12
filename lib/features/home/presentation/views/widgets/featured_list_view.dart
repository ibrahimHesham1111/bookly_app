import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/cubit.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/state.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utlis/app_router.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksStates>(
      builder: (context,state){
        if(state is FeaturedBookSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              itemCount: state.books.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(
                        AppRouter.KBookDetailsView, extra: state.books[index] );
                  },
                  child: CustomBookImage(
                      imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                  ),
                );
              },
            ),
          );
        }else if(state is FeaturedBookErrorState)
        {
          return CustomErrorWidget(errMessage: state.errorMessage);
        }else
        {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}