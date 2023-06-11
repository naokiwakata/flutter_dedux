import 'package:flutter_redux_app/redux/action.dart';
import 'package:flutter_redux_app/redux/reducer.dart';
import 'package:flutter_redux_app/redux/state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

/// counterReducerは純粋な関数であるためテストが容易
void main() {
  group('counter reducer test', () {
    test('counterReducerでincrementが行われるかのテスト', () {
      final store = Store<AppState>(appReducer,
          initialState: const AppState(counterState: CounterState(count: 0)));
      store.dispatch(AppActions.increment);
      expect(store.state.counterState.count, 1);
    });

    test('counterReducerでdecrementが行われるかのテスト', () {
      final store = Store<AppState>(appReducer,
          initialState: const AppState(counterState: CounterState(count: 0)));
      store.dispatch(AppActions.decrement);
      expect(store.state.counterState.count, -1);
    });

    test('100回incrementしてみるテスト', () {
      final store = Store<AppState>(appReducer,
          initialState: const  AppState(counterState: CounterState(count: 0)));

      for(int i = 0; i < 100; i++) {
        store.dispatch(AppActions.increment);
      } 
      expect(store.state.counterState.count, 100);
    });
  });
}
