import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_iq/features/presentation/domain/model/question_model.dart';
import 'package:test_iq/features/presentation/question/widgets/number_indicator_page.dart';
import 'package:test_iq/features/presentation/question/widgets/question_builder.dart';
import 'package:test_iq/features/presentation/question/widgets/timer_question.dart';

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

  void navigationToNextPage() {
    if (_currentIndex + 1 < widget.listquestion.length) {
      _controllerCarousel.jumpToPage(_currentIndex + 1);
    }
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NumberIndicatorPage(
          itemCount: widget.listquestion.length,
          currentIndex: _currentIndex,
          constraints: widget.constraints,
          controllerCarousel: _controllerCarousel,
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
                        onTap: () => navigationToNextPage(),
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
                        navigationToNextPage();
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
