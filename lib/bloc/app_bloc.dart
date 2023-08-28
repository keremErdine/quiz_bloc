import 'package:adv_basics/data/questions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppState questionAnswered(String selectedAnswer) {
    if (state.selectedAnswers!.length == questions.length - 1) {
      return state.copyWith(
          selectedAnswers: state.copyAnswersWith(selectedAnswer),
          activeScreen: 'results-screen');
    } else {
      return state.copyWith(
          currentQuestionIndex: state.currentQuestionIndex =
              state.currentQuestionIndex! + 1,
          selectedAnswers: state.copyAnswersWith(selectedAnswer));
    }
  }

  AppBloc() : super(AppState()) {
    on<AppQuestionAnswerButtonPressed>((event, emit) {
      emit(questionAnswered(event.selectedAnswer));
    });
    on<AppQuizStarted>((event, emit) {
      emit(state.copyWith(
          currentQuestionIndex: 0,
          selectedAnswers: <String>[],
          activeScreen: 'questions-screen'));
    });
  }
}
