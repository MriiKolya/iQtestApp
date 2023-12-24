import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_iq/config/router/app_router.dart';
import 'package:test_iq/config/theme/dart_theme.dart';
import 'package:test_iq/core/bloc/check_all_questions_answered/verification_questions_answered_bloc.dart';
import 'package:test_iq/core/bloc/iq_counter/iq_counter_bloc.dart';
import 'package:test_iq/features/presentation/question/bloc/question_bloc.dart';
import 'package:test_iq/features/presentation/repository/question_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuestionBloc>(
          create: (context) => QuestionBloc(QuestionRepository())
            ..add(
              GetQuestionList(),
            ),
        ),
        BlocProvider<IqCounterBloc>(
          create: (context) => IqCounterBloc(),
        ),
        BlocProvider<VerificationQuestionsAnsweredBloc>(
          create: (context) => VerificationQuestionsAnsweredBloc(),
        )
      ],
      child: MaterialApp.router(
        theme: dartTheme(),
        routerConfig: AppRouter().router,
      ),
    );
  }
}
