import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:test_iq/features/presentation/domain/model/question_model.dart';

part 'iq_counter_event.dart';
part 'iq_counter_state.dart';

class IqCounterBloc extends Bloc<IqCounterEvent, IqCounterState> {
  List<int> listquestionSkipped = [];
  IqCounterBloc() : super(IqCounterState.initial()) {
    on<CalculatingIQ>(_onCalculationIQ);
  }

  _onCalculationIQ(CalculatingIQ event, emit) {
    if (event.answerQuestion == event.question.correctAnswer) {
      listquestionSkipped.remove(event.questionIndex);
      emit(IqCounterState.increment(
        iqCounter: state.iqCounter + 20,
        currentSkippedIndices: listquestionSkipped,
      ));
    } else if (event.answerQuestion == null) {
      listquestionSkipped.addAll(event.listsSippedQuestionIndex);
      emit(IqCounterState.skiped(
        iqCounter: state.iqCounter,
        currentSkippedIndices: listquestionSkipped,
      ));
    } else {
      listquestionSkipped.remove(event.questionIndex);
      emit(IqCounterState.notCorrect(
          iqCounter: state.iqCounter,
          currentSkippedIndices: listquestionSkipped));
    }
  }
}
