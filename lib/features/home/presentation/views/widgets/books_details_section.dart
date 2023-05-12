import 'package:bookly_app/features/home/data/models/books_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_actions.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utlis/styles.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({Key? key, required this.bookModel}) : super(key: key);
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;
    return  Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 30
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal:width*.2,
            ),
            child:  CustomBookImage(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??''
            ),
          ),
          const SizedBox(
            height: 43,
          ),
          Text(
            bookModel.volumeInfo.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle30.copyWith(
                fontWeight: FontWeight.bold,

            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 6,
          ),
          Opacity(
            opacity: .7,
            child: Text(
              bookModel.volumeInfo.authors![0],
              style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
           BookRating(
            rating: bookModel.volumeInfo.averageRating??0,
            count: bookModel.volumeInfo.ratingsCount??0,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(
            height: 37,
          ),
           BooksActions(
             bookModel: bookModel,
           ),
        ],

      ),
    );
  }
}