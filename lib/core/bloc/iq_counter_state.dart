
part of 'iq_counter_bloc.dart';

enum IqCounterStatus { correct, initial, skiped, notCorrect }

class IqCounterState extends Equatable {
  final IqCounterStatus status;
  final int iqCounter;
  final List<int> listSkippedQuestionIndex;

  const IqCounterState({
    required this.iqCounter,
    required this.status,
    required this.listSkippedQuestionIndex,
  });

  factory IqCounterState.initial() => const IqCounterState(
        status: IqCounterStatus.initial,
        iqCounter: 0,
        listSkippedQuestionIndex: [],
      );

  factory IqCounterState.skiped({
    required int iqCounter,
    required List<int> currentSkippedIndices,
  }) =>
      IqCounterState(
        status: IqCounterStatus.skiped,
        iqCounter: iqCounter,
        listSkippedQuestionIndex: currentSkippedIndices,
      );

  factory IqCounterState.increment({
    required int iqCounter,
    required List<int> currentSkippedIndices,
  }) =>
      IqCounterState(
        status: IqCounterStatus.correct,
        iqCounter: iqCounter,
        listSkippedQuestionIndex: currentSkippedIndices,
      );
      
  factory IqCounterState.notCorrect({
    required int iqCounter,
    required List<int> currentSkippedIndices,
  }) =>
      IqCounterState(
        status: IqCounterStatus.notCorrect,
        iqCounter: iqCounter,
        listSkippedQuestionIndex: currentSkippedIndices,
      );

  @override
  List<Object?> get props =>
      [status, iqCounter, listSkippedQuestionIndex]; // Оновлено
}
