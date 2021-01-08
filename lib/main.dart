import 'package:flutter/material.dart';
import 'package:instagram_clone/src/init/init.dart';
import 'package:instagram_clone/src/models/index.dart';
import 'package:instagram_clone/src/presentations/routes.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(const InstagramClone());
}

class InstagramClone extends StatefulWidget {
  const InstagramClone({Key key}) : super(key: key);

  @override
  _InstagramCloneState createState() => _InstagramCloneState();
}

class _InstagramCloneState extends State<InstagramClone> {

  Future<Store<AppState>> _future;

  @override
  void initState() {
    super.initState();
    _future = init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData.dark(),
      routes: AppRoutes.routes,
    );
  }
}
