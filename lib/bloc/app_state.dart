part of 'app_bloc.dart';

enum AppStatus {
  initial,
}

class AppState {
  AppState(
      {required this.status,
      required this.selectedAnswers,
      required this.currentQuestionIndex,
      required this.activeScreen});

  AppStatus status = AppStatus.initial;
  List<String> selectedAnswers = [];
  int currentQuestionIndex = 0;
  String? activeScreen = 'start-screen';

  AppState copyWith(
      {AppStatus? status,
      List<String>? selectedAnswers,
      int? currentQuestionIndex,
      String? activeScreen}) {
    return AppState(
        status: status ?? this.status,
        selectedAnswers: selectedAnswers ?? this.selectedAnswers,
        currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
        activeScreen: activeScreen ?? this.activeScreen);
  }

  List<String> copyAnswersWith(String answer) {
    List<String> copiedAnswers = selectedAnswers;
    copiedAnswers.add(answer);
    return copiedAnswers;
  }

  factory AppState.create() {
    return AppState(
        status: AppStatus.initial,
        selectedAnswers: [],
        currentQuestionIndex: 0,
        activeScreen: 'start-screen');
  }
}
