import 'package:covid19/bloc/abstract_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AbstractScreen<B extends AbstractBloc,
    S extends AbstractScreenState> extends StatefulWidget {
  @protected
  S builder();

  @override
  S createState() => builder();
}

abstract class AbstractScreenState<B> extends State<AbstractScreen> {
  B bloc;

  @protected
  B blocBuilder();

  @override
  void initState() {
    bloc = blocBuilder();
    assert(bloc != null,
        "BLOC null байж болохгүй!!! [AbstractScreen.blocBuilder] ыг implement хийнэ үү.");
    super.initState();
  }

  @protected
  Widget stateBuilder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: stateBuilder(),
    );
  }
}
