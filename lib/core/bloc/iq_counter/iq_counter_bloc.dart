import 'package:bloc/bloc.dart';

import 'package:test_iq/features/presentation/domain/model/question_model.dart';

part 'iq_counter_event.dart';
part 'iq_counter_state.dart';

class IqCounterBloc extends Bloc<IqCounterEvent, IqCounterState> {
  List<int> listsSkippedQuestionIndex = [];
  List<int> listsAnsweredQuestionIndex = [];
  IqCounterBloc() : super(IqCounterState.initial()) {
    on<CalculatingIQ>(_onCalculationIQ);
  }

  void _onCalculationIQ(CalculatingIQ event, Emitter<IqCounterState> emit) {
    if (event.answerQuestion == event.question.correctAnswer) {
      listsSkippedQuestionIndex.remove(event.questionIndex);
      listsAnsweredQuestionIndex.add(event.questionIndex);
      emit(IqCounterState.correctQuestion(
        iqCounter: state.iqCounter + 20,
        listSkippedQuestionIndexes: List.from(listsSkippedQuestionIndex),
        listsAnsweredQuestionIndex: List.from(listsAnsweredQuestionIndex),
      ));
    } else if (event.answerQuestion == null) {
      listsSkippedQuestionIndex.add(event.questionIndex);
      emit(IqCounterState.skipedQuestion(
        iqCounter: state.iqCounter,
        listSkippedQuestionIndexes: List.from(listsSkippedQuestionIndex),
        listsAnsweredQuestionIndex: List.from(listsAnsweredQuestionIndex),
      ));
    } else {
      listsSkippedQuestionIndex.remove(event.questionIndex);
      listsAnsweredQuestionIndex.add(event.questionIndex);
      emit(IqCounterState.notCorrectQuestion(
        iqCounter: state.iqCounter,
        listSkippedQuestionIndexes: List.from(listsSkippedQuestionIndex),
        listsAnsweredQuestionIndex: List.from(listsAnsweredQuestionIndex),
      ));
    }
  }
}
