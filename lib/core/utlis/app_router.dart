import 'package:bookly_app/core/utlis/service_locator.dart';
import 'package:bookly_app/features/home/data/models/books_model.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/manger/similar_books_cubit/cubit.dart';

abstract class AppRouter{
  static const KHomeView='/homeView';
  static const KBookDetailsView='/bookDetailsView';
  static const KSearchView='/SearchView';
 static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: KHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: KSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: KBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context)=>SimilarBooksCubit(
            getIt.get<HomeRepoImpl>()
          ),
            child:  BookDetailsView(
              bookModel: state.extra as BookModel,
            ),
        ),
      ),
    ],
  );
}