import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/models/widgets/filme_tile.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Imdb list'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: BlocBuilder<HomeBloc, HomeState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is HomeStateLoaded) {
                return ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      print('reloaded');
                      return FilmTile(film: state.list[index]);
                    });
              }

              if (state is HomeErrorState) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is HomeStateEmptyList) {
                return const Center(
                  child: Text('Parece que não temos nada aqui...'),
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
