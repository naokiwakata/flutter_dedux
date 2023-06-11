import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_app/redux/action.dart';
import 'package:redux/redux.dart';

import 'redux/reducer.dart';
import 'redux/state.dart';

void main() {
  /// StoreはStateの保持・変更・通知を行うもの
  /// 状態変更処理はReducerを用いて行う
  final store =
      Store<AppState>(counterReducer, initialState: const AppState(count: 0));

  runApp(FlutterReduxApp(
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<AppState> store;

  const FlutterReduxApp({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("This is Flutter Redux"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// StateをWidgetに反映させるためにStoreConnectorを用いる
                StoreConnector<AppState, int>(
                  converter: (store) => store.state.count,
                  builder: (context, count) {
                    return Text(
                      '$count',
                      style: const TextStyle(fontSize: 30),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StoreConnector<AppState, VoidCallback>(
                      converter: (store) {
                        /// StoreにActionを渡すことで状態の変更の行う
                        return () => store.dispatch(AppActions.increment);
                      },
                      builder: (context, callback) {
                        return ElevatedButton(
                          onPressed: callback,
                          child: const Text("increment"),
                        );
                      },
                    ),
                    StoreConnector<AppState, VoidCallback>(
                      converter: (store) {
                        /// StoreにActionを渡すことで状態の変更の行う
                        return () => store.dispatch(AppActions.decrement);
                      },
                      builder: (context, callback) {
                        return ElevatedButton(
                          onPressed: callback,
                          child: const Text("decrement"),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
