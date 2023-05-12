import 'package:bookly_app/features/home/data/models/books_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child:Column(
            children:   [
              const SizedBox(
                height: 15,
              ),
              const CustomBookDetailsAppBar(),
              BooksDetailsSection(
                bookModel: bookModel,
              ),
              const Expanded(
                child: SizedBox(
                  height: 50.0,
                ),
              ),
              const SimilarBooksSection(),
              const SizedBox(
                height: 40,
              ),

            ],
          ) ,
        )
      ],
    );

  }
}














