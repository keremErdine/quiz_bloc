import 'package:adv_basics/data/questions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<AppQuestionAnswerButtonPressed>((event, emit) {
      if (state.selectedAnswers!.length == questions.length - 1) {
        emit(state.copyWith(
            selectedAnswers: state.copyAnswersWith(event.selectedAnswer),
            activeScreen: 'results-screen'));
      } else {
        emit(state.copyWith(
            currentQuestionIndex: state.currentQuestionIndex =
                state.currentQuestionIndex! + 1,
            selectedAnswers: state.copyAnswersWith(event.selectedAnswer)));
      }
    });
    on<AppQuizStarted>((event, emit) {
      emit(state.copyWith(
          currentQuestionIndex: 0,
          selectedAnswers: <String>[],
          activeScreen: 'questions-screen'));
    });
  }
}
