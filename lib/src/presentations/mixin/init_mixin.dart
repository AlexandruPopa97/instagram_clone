import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_clone/src/init/init.dart';
import 'package:instagram_clone/src/models/index.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';

mixin InitMixin<S extends StatefulWidget> on State<S> {
  final Completer<Store<AppState>> _completer = Completer<Store<AppState>>();

  @override
  void initState() {
    super.initState();
    _initStore();
  }

  Future<void> _initStore() async {
    final List<dynamic> result = await ConcatStream<dynamic>(<Stream<dynamic>>[
      init().asStream(),
      Future<void>.delayed(const Duration(seconds: 2)).asStream(),
    ]).toList();

    final FutureOr<Store<AppState>> res = result[0] as FutureOr<Store<AppState>>;
    _completer.complete(res);
  }

  Future<Store<AppState>> get future => _completer.future;
}
