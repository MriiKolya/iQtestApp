part of 'verification_questions_answered_bloc.dart';

sealed class VerificationQuestionsAnsweredEvent {
  const VerificationQuestionsAnsweredEvent();
}

class CheckAllQuestionsAnswered extends VerificationQuestionsAnsweredEvent {
  final List<QuestionModel> listqQuestion;
  final List<int> listsAnsweredQuestionIndex;

  const CheckAllQuestionsAnswered({
    required this.listqQuestion,
    required this.listsAnsweredQuestionIndex,
  });
}
