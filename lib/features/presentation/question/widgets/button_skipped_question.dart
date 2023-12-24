import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_iq/config/router/router_name.dart';
import 'package:test_iq/core/bloc/check_all_questions_answered/verification_questions_answered_bloc.dart';
import 'package:test_iq/core/bloc/iq_counter/iq_counter_bloc.dart';
import 'package:test_iq/core/widgets/snack_bar_message.dart';

class ButtonSkipedQuestion extends StatelessWidget {
  const ButtonSkipedQuestion({
    super.key,
    required this.onTap(),
    required this.iqResult,
    required this.timeResult,
  });

  final void Function() onTap;
  final String iqResult;
  final String timeResult;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: BlocListener<VerificationQuestionsAnsweredBloc,
          VerificationQuestionsAnsweredState>(
        listener: (context, state) {
          if (state.status ==
              VerificationQuestionsAnsweredStatus.allQuestionsAnswered) {
            resetAllBloc(context);
            context.goNamed(
              AppRouteConstants.resultIQRouteName,
              pathParameters: {
                'iqResult': iqResult,
                'timeResult': timeResult,
              },
            );
          } else if (state.status ==
              VerificationQuestionsAnsweredStatus.notAllQuestionsAnswered) {
            SnackBarMessage.showSnackBarException(
              message: 'You have missing questions',
              context: context,
            );
          }
        },
        child: GestureDetector(
          onTap: () => onTap(),
          child: Padding(
            padding: const EdgeInsets.only(right: 30, bottom: 30),
            child: Text(
              'Skip',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }

  void resetAllBloc(BuildContext context) {
    context
        .read<VerificationQuestionsAnsweredBloc>()
        .add(ResetVerificationQuestionsAnsweredBloc());
    context.read<IqCounterBloc>().add(ResetIqCounterBloc());
  }
}
