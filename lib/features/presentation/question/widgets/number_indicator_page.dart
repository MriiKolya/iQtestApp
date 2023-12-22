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
  });

  final BoxConstraints constraints;
  final CarouselController controllerCarousel;
  final int currentIndex;
  final int itemCount;

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
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth / 40,
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: currentIndex == index
                      ? ConstantColor.primaryColor
                      : Colors.grey,
                  child: Text(
                    (index + 1).toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              onTap: () {
                controllerCarousel.jumpToPage(index);
              },
            );
          },
          itemCount: itemCount,
        ),
      ),
    );
  }
}
