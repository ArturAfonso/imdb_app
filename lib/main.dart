import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_app/pages/bloc/home_bloc.dart';
import 'package:imdb_app/pages/bloc/home_event.dart';

import 'pages/bloc/home_state.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imdb App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(HomeLoadingState())..add(HomeFetchList()),
          child: const HomePage()),
    );
  }
}
