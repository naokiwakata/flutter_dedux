import 'package:flutter_redux_app/redux/state.dart';

import 'action.dart';

/// AppStateのReducerを定義
/// Storeが扱うのはあくまでAppStateなのでAppStateを扱うReducerが必要
AppState appReducer(AppState state, dynamic action) {
  return AppState(
    counterState: counterReducer(state.counterState, action),
  );
}

/// StateとActionから新しいStateを生成する
/// 副作用のない純粋な関数である必要がある
CounterState counterReducer(CounterState state, dynamic action) {
  switch (action) {
    case CounterActions.increment:
      return state.copyWith(count: state.count + 1);
    case CounterActions.decrement:
      return state.copyWith(count: state.count - 1);
  }
  return state;
}
