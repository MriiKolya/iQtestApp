import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_iq/features/constant/constant_color.dart';
import 'package:test_iq/features/presentation/question/bloc/question_bloc.dart';
import 'package:test_iq/features/presentation/question/widgets/question_list.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return BlocBuilder<QuestionBloc, QuestionState>(
            builder: (context, state) {
              if (state.status == QuestionStatus.succes) {
                return QuestionList(
                  constraints: constraints,
                  listquestion: state.listquestion,
                );
              } else if (state.status == QuestionStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == QuestionStatus.error) {
                return Center(
                  child: Text(
                    state.textError.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: ConstantColor.exceptionColor),
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return const SizedBox();
            },
          );
        }),
      ),
    );
  }
}
