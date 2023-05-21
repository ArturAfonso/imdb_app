import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../shared/models/filme_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(HomeLoadingState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    HomeState state;
    switch (event.runtimeType) {
      case HomeFetchList:
        state = await fetchList();
        break;
      case HomeFetchListWithError:
        state = HomeErrorState(message: 'algo nao funcionou');
        break;
      case HomeFetchListWithEmptyList:
        state = HomeStateEmptyList(list: const []);
        break;
      default:
        state = HomeErrorState(message: 'algo nao funcionou');
    }

    yield state;
  }

  Future<HomeState> fetchList() async {
    List<FilmModel> itemList = [];
    String apiKey = 'k_xfn4ldbv';
    String url =
        'https://imdb-api.com/API/AdvancedSearch/$apiKey?title_type=tv_movie&countries=br&languages=pt&sort=release_date,desc';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = jsonDecode(response.body);

      List<dynamic> map = jsonMap['results'];

      for (var element in map) {
        itemList.add(FilmModel.fromJson(element));
      }
      if (itemList.isNotEmpty) {
        return HomeStateLoaded(list: itemList.take(10).toList());
      } else {
        return HomeStateEmptyList(list: const []);
      }
    } else {
      return HomeErrorState(message: "Falha ao buscar dados");
    }

    // return HomeStateLoaded(list: itemList);
  }
}
