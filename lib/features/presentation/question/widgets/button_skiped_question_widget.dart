import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_iq/config/router/router_name.dart';
import 'package:test_iq/core/bloc/check_all_questions_answered/verification_questions_answered_bloc.dart';
import 'package:test_iq/core/widgets/snack_bar_message.dart';

class ButtonSkipedQuestion extends StatelessWidget {
  const ButtonSkipedQuestion({
    super.key,
    required this.onTap(int? index),
  });

  final void Function(int? index) onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: BlocListener<VerificationQuestionsAnsweredBloc,
          VerificationQuestionsAnsweredState>(
        listener: (context, state) {
          if (state.status ==
              VerificationQuestionsAnsweredStatus.allQuestionsAnswered) {
            context
                .go(context.namedLocation(AppRouteConstants.resultIQRouteName));
          } else if (state.status ==
              VerificationQuestionsAnsweredStatus.notAllQuestionsAnswered) {
            SnackBarMessage.showSnackBarException(
              message: 'Missing questions ',
              context: context,
            );
          }
        },
        child: GestureDetector(
          onTap: () => onTap(null),
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
}
