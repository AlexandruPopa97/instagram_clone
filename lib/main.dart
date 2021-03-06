import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagram_clone/src/models/index.dart';
import 'package:instagram_clone/src/presentations/mixin/init_mixin.dart';
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

class _InstagramCloneState extends State<InstagramClone> with InitMixin<InstagramClone> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Store<AppState>>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<Store<AppState>> snapshot) {
        if (snapshot.hasData) {
          final Store<AppState> store = snapshot.data;

          return StoreProvider<AppState>(
            store: store,
            child: MaterialApp(
              title: 'Instagram',
              theme: ThemeData.dark(),
              routes: AppRoutes.routes,
            ),
          );
        } else {
          if (snapshot.hasError) {
            throw snapshot.error;
          }

          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
