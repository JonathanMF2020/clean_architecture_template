import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_teca/core/bloc_observer/simple_bloc_observer.dart';
import 'package:movie_teca/features/movies/presentation/bloc/movies/movie_bloc.dart';
import 'package:movie_teca/features/movies/presentation/bloc/movies/movie_event.dart';
import 'package:movie_teca/features/movies/presentation/pages/home/movies_home.dart';

import 'config/routes/routes.dart';
import 'config/theme/app_themes.dart';
import 'features/movies/presentation/bloc/auth/auth_bloc.dart';
import 'features/movies/presentation/bloc/auth/auth_event.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (context) => sl<MovieBloc>()..add(const GetMovies()),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>()..add(const CreateSession()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        title: 'Movies Pérronas',
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const MoviesHome(),
      ),
    );
  }
}
