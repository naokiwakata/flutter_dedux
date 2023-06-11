import 'package:flutter_redux_app/redux/state.dart';

import 'action.dart';

/// StateとActionから新しいStateを生成する
/// 副作用のない純粋な関数である必要がある
AppState counterReducer(AppState state, dynamic action) {
  switch (action) {
    case AppActions.increment:
      return state.copyWith(count: state.count + 1);
    case AppActions.decrement:
      return state.copyWith(count: state.count - 1);
  }
  return state;
}
