import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_iq/features/presentation/domain/model/question_model.dart';

part 'verification_questions_answered_event.dart';
part 'verification_questions_answered_state.dart';

class VerificationQuestionsAnsweredBloc extends Bloc<
    VerificationQuestionsAnsweredEvent, VerificationQuestionsAnsweredState> {
  VerificationQuestionsAnsweredBloc()
      : super(VerificationQuestionsAnsweredState.initial()) {
    on<CheckAllQuestionsAnswered>(_onCheckIsAllQuestionsAnswered);
    on<ResetVerificationQuestionsAnsweredBloc>(
        _onResetVerificationQuestionsAnsweredBloc);
  }

  _onCheckIsAllQuestionsAnswered(CheckAllQuestionsAnswered event,
      Emitter<VerificationQuestionsAnsweredState> emit) {
    if (event.listsAnsweredQuestionIndex.length + 1 ==
        event.listqQuestion.length) {
      emit(VerificationQuestionsAnsweredState.allQuestionsAnswered());
    } else {
      List<int> allIndices =
          List.generate(event.listqQuestion.length, (index) => index);

      List<int> listSkippedQuestionIndex = allIndices
          .where((index) => !event.listsAnsweredQuestionIndex.contains(index))
          .toList();

      emit(VerificationQuestionsAnsweredState.noAllQuestionsAnswered(
          listSkippedQuestionIndexes: listSkippedQuestionIndex));
    }
  }

  _onResetVerificationQuestionsAnsweredBloc(
      ResetVerificationQuestionsAnsweredBloc event,
      Emitter<VerificationQuestionsAnsweredState> emit) {
    emit(VerificationQuestionsAnsweredState.initial());
  }
}
