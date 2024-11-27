import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_teca/features/movies/presentation/bloc/auth/auth_bloc.dart';
import 'package:movie_teca/features/movies/presentation/bloc/auth/auth_state.dart';
import 'package:movie_teca/features/movies/presentation/widgets/movie_widget.dart';

import '../../bloc/movies/movie_bloc.dart';
import '../../bloc/movies/movie_state.dart';

class MoviesHome extends StatelessWidget {
  const MoviesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _listenerAuth(context);
  }

  BlocListener<AuthBloc, AuthState> _listenerAuth(BuildContext contextBuild) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthDone) {
          print(
              "Bienvenido ${state.movies.guest_session_id} Expiration: ${state.movies.expires_at}");
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error al authenticar tu usuario')),
          );
        }
      },
      child: Scaffold(
        appBar: _buildAppbar(contextBuild),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Movies Perronas',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        GestureDetector(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Container _buildBody() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (_, state) {
          if (state is MovieLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is MovieError) {
            return const Center(child: Icon(Icons.refresh));
          }
          if (state is MovieDone) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return MovieWidget(
                  movie: state.movies[index],
                );
              },
              itemCount: state.movies.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
