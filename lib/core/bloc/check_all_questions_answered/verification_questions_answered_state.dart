part of 'verification_questions_answered_bloc.dart';

enum VerificationQuestionsAnsweredStatus {
  allQuestionsAnswered,
  notAllQuestionsAnswered,
  initial
}

class VerificationQuestionsAnsweredState extends Equatable {
  final VerificationQuestionsAnsweredStatus status;
  final List<int> listSkippedQuestionIndexes;
  const VerificationQuestionsAnsweredState({
    required this.status,
    required this.listSkippedQuestionIndexes,
  });

  factory VerificationQuestionsAnsweredState.initial() {
    return const VerificationQuestionsAnsweredState(
      status: VerificationQuestionsAnsweredStatus.initial,
      listSkippedQuestionIndexes: [],
    );
  }

  factory VerificationQuestionsAnsweredState.allQuestionsAnswered() {
    return const VerificationQuestionsAnsweredState(
      status: VerificationQuestionsAnsweredStatus.allQuestionsAnswered,
      listSkippedQuestionIndexes: [],
    );
  }

  factory VerificationQuestionsAnsweredState.noAllQuestionsAnswered(
      {required List<int> listSkippedQuestionIndexes}) {
    return VerificationQuestionsAnsweredState(
      status: VerificationQuestionsAnsweredStatus.notAllQuestionsAnswered,
      listSkippedQuestionIndexes: listSkippedQuestionIndexes,
    );
  }

  @override
  List<Object> get props => [status, listSkippedQuestionIndexes];
}
