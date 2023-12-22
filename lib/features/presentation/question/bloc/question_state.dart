part of 'question_bloc.dart';

enum QuestionStatus { initial, loading, error, succes }

class QuestionState extends Equatable {
  final List<QuestionModel> listquestion;
  final QuestionStatus status;
  final String textError;

  const QuestionState({
    required this.listquestion,
    required this.status,
    required this.textError,
  });

  factory QuestionState.initial() {
    return const QuestionState(
      listquestion: [],
      status: QuestionStatus.initial,
      textError: '',
    );
  }
  factory QuestionState.loading() {
    return const QuestionState(
      listquestion: [],
      status: QuestionStatus.loading,
      textError: '',
    );
  }

  factory QuestionState.succes({
    required List<QuestionModel> listquestion,
  }) {
    return QuestionState(
      listquestion: listquestion,
      status: QuestionStatus.succes,
      textError: '',
    );
  }

  factory QuestionState.error({
    required String textError,
  }) {
    return QuestionState(
      listquestion: const [],
      status: QuestionStatus.error,
      textError: textError,
    );
  }

  @override
  List<Object?> get props => [status, textError, listquestion];

  QuestionState copyWith({
    List<QuestionModel>? listquestion,
    QuestionStatus? status,
    String? textError,
  }) {
    return QuestionState(
      listquestion: listquestion ?? this.listquestion,
      status: status ?? this.status,
      textError: textError ?? this.textError,
    );
  }
}
