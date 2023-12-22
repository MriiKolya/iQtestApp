import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_iq/features/presentation/domain/model/question_model.dart';
import 'package:test_iq/features/presentation/repository/question_repository.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final QuestionRepository _repository;
  QuestionBloc(QuestionRepository repository)
      : _repository = repository,
        super(QuestionState.initial()) {
    on<GetQuestionList>(_onGetQuestionList);
  }

  _onGetQuestionList(event, emit) async {
    try {
      emit(QuestionState.loading());
      var listquestion = await _repository.getQuestionList();
      emit(QuestionState.succes(listquestion: listquestion));
    } catch (e) {
      debugPrint(e.toString());
      emit(QuestionState.error(textError: 'something went wrong'));
    }
  }
}
