import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_iq/config/router/router_name.dart';
import 'package:test_iq/features/presentation/question/view/question_screen.dart';
import 'package:test_iq/features/presentation/result_iq/result_screen.dart';
import 'package:test_iq/features/presentation/welcome/welcome_screen.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: '/welcome',
    routes: [
      GoRoute(
        path: '/welcome',
        name: AppRouteConstants.welcomeRouteName,
        builder: (BuildContext context, GoRouterState state) =>
            const WelcomeScreen(),
      ),
      GoRoute(
        path: '/question',
        name: AppRouteConstants.questionRouteName,
        builder: (BuildContext context, GoRouterState state) =>
            const QuestionScreen(),
      ),
      GoRoute(
        path: '/resultIQ/:iqResult/:timeResult',
        name: AppRouteConstants.resultIQRouteName,
        builder: (BuildContext context, GoRouterState state) {
          return ResultIQScreen(
            iqResult: int.parse(state.pathParameters['iqResult']!),
            timeResult: state.pathParameters['timeResult'].toString(),
          );
        },
      ),
    ],
  );
}
