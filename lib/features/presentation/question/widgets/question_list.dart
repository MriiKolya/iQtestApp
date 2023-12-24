import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_iq/core/bloc/check_all_questions_answered/verification_questions_answered_bloc.dart';
import 'package:test_iq/core/bloc/iq_counter/iq_counter_bloc.dart';
import 'package:test_iq/core/widgets/snack_bar_message.dart';
import 'package:test_iq/features/presentation/domain/model/question_model.dart';
import 'package:test_iq/features/presentation/question/widgets/widgets.dart';

class QuestionList extends StatefulWidget {
  const QuestionList({
    super.key,
    required this.constraints,
    required this.listquestion,
  });

  final BoxConstraints constraints;
  final List<QuestionModel> listquestion;

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  final _controllerCarousel = CarouselController();
  List<int> listsAnsweredQuestionIndex = [];
  int _currentIndex = 0;
  late String iqResult;
  late String timeResult = '0';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<IqCounterBloc, IqCounterState>(
          builder: (BuildContext context, IqCounterState state) {
            iqResult = state.iqCounter.toString();
            listsAnsweredQuestionIndex = state.listsAnsweredQuestionIndex;
            return NumberIndicatorPage(
              listsAnsweredQuestionIndex: listsAnsweredQuestionIndex,
              skippedQuestionIndexes: state.listSkippedQuestionIndexes,
              itemCount: widget.listquestion.length,
              currentIndex: _currentIndex,
              constraints: widget.constraints,
              controllerCarousel: _controllerCarousel,
              navigationNumber: (index) {
                context.read<IqCounterBloc>().add(
                      CalculatingIQ(
                        question: widget.listquestion[_currentIndex],
                        questionIndex: _currentIndex,
                      ),
                    );
                navigationPage(index);
              },
            );
          },
        ),
        Expanded(
          child: CarouselSlider.builder(
            carouselController: _controllerCarousel,
            itemCount: widget.listquestion.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return Scaffold(
                body: Column(
                  children: [
                    ButtonSkipedQuestion(
                      timeResult: timeResult,
                      iqResult: iqResult,
                      onTap: () {
                        context.read<IqCounterBloc>().add(CalculatingIQ(
                              question: widget.listquestion[itemIndex],
                              questionIndex: itemIndex,
                            ));
                        navigationPage();
                      },
                    ),
                    QuestionBuilder(
                      constraints: widget.constraints,
                      listquestion: widget.listquestion,
                      itemIndex: itemIndex,
                      onTap: (String selectedOption) {
                        navigationPage();
                        context.read<IqCounterBloc>().add(CalculatingIQ(
                              answerQuestion: selectedOption,
                              question: widget.listquestion[itemIndex],
                              questionIndex: itemIndex,
                            ));
                      },
                    )
                  ],
                ),
              );
            },
            options: CarouselOptions(
                initialPage: _currentIndex,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                viewportFraction: 1,
                height: widget.constraints.maxHeight * 0.8,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
          ),
        ),
        TimerQuestion(
          updateTimer: (String updateTimer) {
            timeResult = updateTimer;
          },
        )
      ],
    );
  }

  void navigationPage([int? index]) {
    // Если индекс передан
    if (index != null) {
      // Проверяем, был ли вопрос с таким индексом уже отвечен
      if (listsAnsweredQuestionIndex.contains(index)) {
        SnackBarMessage.showSnackBarException(
          message: 'that question has already been answered.',
          context: context,
        );
        return;
      }

      // Если индекс не совпадает с текущим, переходим к указанному вопросу
      if (index != _currentIndex) {
        _controllerCarousel.jumpToPage(index);
      }
      return;
    }

    // Переход к следующему нерешенному вопросу в карусели
    if (_currentIndex < widget.listquestion.length) {
      int nextUnansweredIndex = _currentIndex + 1;

      // Находим следующий нерешенный вопрос
      while (nextUnansweredIndex < widget.listquestion.length &&
          listsAnsweredQuestionIndex.contains(nextUnansweredIndex)) {
        nextUnansweredIndex++;
      }

      // Если нашли нерешенный вопрос, переходим к нему
      if (nextUnansweredIndex < widget.listquestion.length) {
        _controllerCarousel.jumpToPage(nextUnansweredIndex);
      } else {
        context.read<VerificationQuestionsAnsweredBloc>().add(
              CheckAllQuestionsAnswered(
                listqQuestion: widget.listquestion,
                listsAnsweredQuestionIndex: listsAnsweredQuestionIndex,
              ),
            );
      }
      return;
    }
  }
}
