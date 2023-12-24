part of 'iq_counter_bloc.dart';

enum IqCounterStatus {
  correctQuestion,
  initial,
  skipedQuestion,
  notCorrectQuestion,
}

class IqCounterState {
  final IqCounterStatus status;
  final int iqCounter;
  final List<int> listSkippedQuestionIndexes;
  final List<int> listsAnsweredQuestionIndex;

  const IqCounterState({
    required this.listsAnsweredQuestionIndex,
    required this.iqCounter,
    required this.status,
    required this.listSkippedQuestionIndexes,
  });

  factory IqCounterState.initial() => const IqCounterState(
        status: IqCounterStatus.initial,
        iqCounter: 0,
        listSkippedQuestionIndexes: [],
        listsAnsweredQuestionIndex: [],
      );

  factory IqCounterState.skipedQuestion({
    required int iqCounter,
    required List<int> listSkippedQuestionIndexes,
    required List<int> listsAnsweredQuestionIndex,
  }) =>
      IqCounterState(
        status: IqCounterStatus.skipedQuestion,
        iqCounter: iqCounter,
        listSkippedQuestionIndexes: listSkippedQuestionIndexes,
        listsAnsweredQuestionIndex: listsAnsweredQuestionIndex,
      );

  factory IqCounterState.correctQuestion({
    required int iqCounter,
    required List<int> listSkippedQuestionIndexes,
    required List<int> listsAnsweredQuestionIndex,
  }) =>
      IqCounterState(
        status: IqCounterStatus.correctQuestion,
        iqCounter: iqCounter,
        listSkippedQuestionIndexes: listSkippedQuestionIndexes,
        listsAnsweredQuestionIndex: listsAnsweredQuestionIndex,
      );

  factory IqCounterState.notCorrectQuestion({
    required List<int> listsAnsweredQuestionIndex,
    required int iqCounter,
    required List<int> listSkippedQuestionIndexes,
  }) =>
      IqCounterState(
        status: IqCounterStatus.notCorrectQuestion,
        iqCounter: iqCounter,
        listSkippedQuestionIndexes: listSkippedQuestionIndexes,
        listsAnsweredQuestionIndex: listsAnsweredQuestionIndex,
      );
}
