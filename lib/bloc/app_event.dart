part of 'app_bloc.dart';

abstract class AppEvent {}

class AppQuestionAnswerButtonPressed extends AppEvent {
  AppQuestionAnswerButtonPressed({required this.selectedAnswer});
  final String selectedAnswer;
}

class AppQuizStarted extends AppEvent {}
