import 'package:adv_basics/bloc/app_bloc.dart';
import 'package:flutter/material.dart';

import 'package:adv_basics/quiz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => AppBloc(),
    child: const Quiz(),
  ));
}
