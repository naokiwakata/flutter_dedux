import 'package:flutter/material.dart';

/// アプリ全体の状態を1つのStateで表現する
@immutable
class AppState {
  final CounterState counterState;

  const AppState({required this.counterState});
}

/// カウンターの状態を表す
@immutable
class CounterState {
  final int count;
  const CounterState({required this.count});

    CounterState copyWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }
}
