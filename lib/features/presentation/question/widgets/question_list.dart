import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_iq/config/router/router_name.dart';
import 'package:test_iq/core/bloc/iq_counter_bloc.dart';
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

  void navigationPage([int? index]) {
    if (index == null) {
      if (_currentIndex + 1 < widget.listquestion.length) {
        _controllerCarousel.jumpToPage(_currentIndex + 1);
      } else {
        context.go(context.namedLocation(AppRouteConstants.resultIQRouteName));
      }
    } else {
      _controllerCarousel.jumpToPage(index);
    }
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<IqCounterBloc, IqCounterState>(
          listener: (context, state) {},
          builder: (BuildContext context, IqCounterState state) {
            return NumberIndicatorPage(
              skippedQuestionIndex: state.listSkippedQuestionIndex,
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
            itemCount: 10,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return Scaffold(
                body: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          context.read<IqCounterBloc>().add(CalculatingIQ(
                                question: widget.listquestion[itemIndex],
                                questionIndex: itemIndex,
                              ));
                          navigationPage();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30, bottom: 30),
                          child: Text(
                            'Skip',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
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
        const TimerQuestion()
      ],
    );
  }
}
