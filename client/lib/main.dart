import 'package:bloc/bloc.dart';
import 'package:client/core/inject.dart';
import 'package:client/core/simple_bloc_observer.dart';
import 'package:client/src/app_widget.dart';
import 'package:flutter/material.dart';

void main() {
  Inject.init();
  Bloc.observer = const SimpleBlocObserver();
  runApp(const AppWidget());
}
