import 'package:flutter/material.dart';

/// アプリ全体の状態を1つのStateで表現する
@immutable
class AppState {
  final int count;

  const AppState({required this.count});

  AppState copyWith({int? count}) {
    return AppState(count: count ?? this.count);
  }
}
