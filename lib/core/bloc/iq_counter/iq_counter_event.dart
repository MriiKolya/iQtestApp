part of 'iq_counter_bloc.dart';

sealed class IqCounterEvent {
  const IqCounterEvent();
}

class CalculatingIQ extends IqCounterEvent {
  final QuestionModel question;
  final String? answerQuestion;
  final int questionIndex;
  final List<int> listsSkippedQuestionIndex;
  final List<int> listsAnsweredQuestionIndex;

  CalculatingIQ({
    required this.questionIndex,
    this.answerQuestion,
    required this.question,
    List<int>? existingSkipped,
    List<int>? existingAnswered,
  })  : listsSkippedQuestionIndex = existingSkipped ?? [],
        listsAnsweredQuestionIndex = existingAnswered ?? [] {
    if (answerQuestion != null) {
      listsAnsweredQuestionIndex.add(questionIndex);
    } else {
      listsSkippedQuestionIndex.add(questionIndex);
    }
  }
}

class ResetIqCounterBloc extends IqCounterEvent {}
