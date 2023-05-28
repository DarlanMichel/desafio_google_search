import 'package:asuka/asuka.dart';
import 'package:client/src/home/presentation/bloc/google_bloc.dart';
import 'package:client/src/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Search Client',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      builder: Asuka.builder,
      navigatorObservers: [Asuka.asukaHeroController],
      home: BlocProvider(
          create: (context) => GetIt.instance.get<GoogleBloc>(),
          child: const HomePage()),
    );
  }
}
