import 'package:bookly_app/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utlis/functions/launch_url.dart';
import '../../../../../core/widgets/custom_botton.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children:   [
        const Expanded(
            child: CustomButton(
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            )
        ),

        Expanded(
            child: CustomButton(
              onPressed: ()
              async{
                launchCustomUrl(context,bookModel.volumeInfo.previewLink);
              },
                fontSize: 16,
                text: getText(bookModel),
                backgroundColor: const Color(0xffEF8262),
                textColor: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
              ),
            )
        ),
      ],
    );
  }

}

String getText(BookModel bookModel){
  if(bookModel.volumeInfo.previewLink == null){
    return 'Not available';
  }else{
    return 'Preview';
  }
}

