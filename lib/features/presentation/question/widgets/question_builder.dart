import 'package:flutter/material.dart';
import 'package:test_iq/features/constant/constant_color.dart';
import 'package:test_iq/features/presentation/domain/model/question_model.dart';

class QuestionBuilder extends StatelessWidget {
  const QuestionBuilder(
      {super.key,
      required this.constraints,
      required this.listquestion,
      required this.itemIndex,
      required this.onTap});

  final BoxConstraints constraints;
  final void Function(String selectedOption) onTap;
  final List<QuestionModel> listquestion;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth / 10),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: constraints.maxHeight / 5,
              width: double.infinity,
              child: Text(
                listquestion[itemIndex].question.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight / 25,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: constraints.maxHeight / 2,
                width: constraints.maxWidth * 0.7,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listquestion[itemIndex].options.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () =>
                            onTap(listquestion[itemIndex].options[index]),
                        child: Container(
                          decoration: BoxDecoration(
                              color: ConstantColor.primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: FittedBox(
                            child: Text(
                              listquestion[itemIndex].options[index],
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          )),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
