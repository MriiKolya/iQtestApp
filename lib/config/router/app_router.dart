import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_iq/config/router/router_name.dart';
import 'package:test_iq/features/presentation/question/view/question_screen.dart';
import 'package:test_iq/features/presentation/welcome_screen/welcome_screen.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: '/welcome',
    routes: [
      GoRoute(
        path: '/welcome',
        name: AppRouteConstants.welcomeRouteName,
        builder: (BuildContext contex, GoRouterState state) =>
            const WelcomeScreen(),
      ),
      GoRoute(
        path: '/question',
        name: AppRouteConstants.questionRouteName,
        builder: (BuildContext contex, GoRouterState state) => const QuestionScreen(),
      ),
    ],
  );
}
