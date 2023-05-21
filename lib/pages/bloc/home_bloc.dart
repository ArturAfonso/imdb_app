import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(HomeLoadingState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    HomeState state;
    switch (event.runtimeType) {
      case HomeFetchList:
        state = await _fetchList();
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

  Future<HomeState> _fetchList() async {
    var list = await Future.delayed(
        const Duration(seconds: 3),
        () => <String>[
              'Iem 1',
              'Iem 2',
              'Iem 3',
              'Iem 4',
              'Iem 5',
              'Iem 6',
              'Iem 7',
              'Iem 8',
              'Iem 9',
              'Iem 10',
            ]);

    return HomeStateLoaded(list: list);
  }
}
