part of 'iq_counter_bloc.dart';

sealed class IqCounterEvent extends Equatable {
  const IqCounterEvent();

  @override
  List<Object> get props => [];
}

class CalculatingIQ extends IqCounterEvent {
  final QuestionModel question;
  final String? answerQuestion;
  final int questionIndex;
  final List<int> listsSippedQuestionIndex;
  CalculatingIQ({
    required this.questionIndex,
    this.answerQuestion,
    required this.question,
    List<int>? existingSkiped,
  }) : listsSippedQuestionIndex = existingSkiped ?? [] {
    listsSippedQuestionIndex.add(questionIndex);
  }
}
