 import 'dart:async';

abstract class AbstractBloc{
  StreamController<bool> loadingIndicatorStream;

  AbstractBloc(){
    loadingIndicatorStream = StreamController.broadcast();
  }

  dispose(){

    loadingIndicatorStream.close();
  }
}