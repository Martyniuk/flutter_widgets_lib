import 'dart:async';

import '../api/response.dart';
import '../repository/chuck_repository.dart';
import '../models/chuck_response.dart';

class ChuckBloc {
  ChuckRepository _chuckRepository;
  StreamController _chuckDataController;

  StreamSink<Response<ChuckResponse>> get chuckDataSink =>
      _chuckDataController.sink;

  Stream<Response<ChuckResponse>> get chuckDataStream =>
      _chuckDataController.stream;

  ChuckBloc(String category) {
    _chuckDataController = StreamController<Response<ChuckResponse>>();
    _chuckRepository = ChuckRepository();
    fetchChuckyJoke(category);
  }

  fetchChuckyJoke(String category) async {
    chuckDataSink.add(Response.loading('Getting A Chucky Joke!'));
    try {
      ChuckResponse chuckJoke = await _chuckRepository.fetchChuckJoke(category);
      chuckDataSink.add(Response.completed(chuckJoke));
    } catch (e) {
      chuckDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _chuckDataController?.close();
  }
}