import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import 'package:test_iq/features/constant/constant_color.dart';

class NumberIndicatorPage extends StatelessWidget {
  const NumberIndicatorPage({
    super.key,
    required this.constraints,
    required this.controllerCarousel,
    required this.currentIndex,
    required this.itemCount,
    required this.skippedQuestionIndexes,
    required this.navigationNumber,
    required this.listsAnsweredQuestionIndex,
  });

  final BoxConstraints constraints;
  final CarouselController controllerCarousel;
  final int currentIndex;
  final int itemCount;
  final List<int> skippedQuestionIndexes;
  final List<int> listsAnsweredQuestionIndex;
  final void Function(int index) navigationNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth / 25),
      child: SizedBox(
        width: double.infinity,
        height: constraints.maxHeight / 15,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => navigationNumber(index),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth / 40,
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: _getIndicatorColor(index),
                  child: Text(
                    (index + 1).toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            );
          },
          itemCount: itemCount,
        ),
      ),
    );
  }

  Color _getIndicatorColor(int index) {
    if (index == currentIndex) {
      return ConstantColor.primaryColor;
    } else if (listsAnsweredQuestionIndex.contains(index)) {
      return ConstantColor.successColor;
    } else if (skippedQuestionIndexes.contains(index)) {
      return ConstantColor.exceptionColor;
    } else {
      return Colors.grey;
    }
  }
}
