import 'package:bookly_app/core/utlis/app_router.dart';
import 'package:bookly_app/features/home/data/models/books_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants/constants.dart';
import '../../../../../core/utlis/assets_data.dart';
import '../../../../../core/utlis/styles.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.KBookDetailsView, extra: bookModel );
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 30),
              child:CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      style: Styles.textStyle20.copyWith(
                          fontFamily:kGtSectraFine
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                   Text(
                    bookModel.volumeInfo.authors![0],
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                       BookRating(
                        rating: bookModel.volumeInfo.averageRating?.round() ?? 0,
                         count: bookModel.volumeInfo.ratingsCount ?? 0,
                      ),
                      const SizedBox(
                        width: 30,
                      )

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


