import 'package:adv_basics/bloc/app_bloc.dart';
import 'package:flutter/material.dart';

import 'package:adv_basics/screens/start/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';

import 'package:adv_basics/screens/results/results_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(context) {
    Widget screenWidget = const StartScreen();

    return MaterialApp(
      home: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {
          if (state.activeScreen == 'questions-screen') {
            screenWidget = QuestionsScreen(
              state: state,
            );
          }
          if (state.activeScreen == 'results-screen') {
            screenWidget = const ResultsScreen();
          }
        },
        builder: ((context, state) {
          return Scaffold(
              body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 78, 13, 151),
                  Color.fromARGB(255, 107, 15, 168),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget,
          ));
        }),
      ),
    );
  }
}
