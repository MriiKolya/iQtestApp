import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_iq/config/router/router_name.dart';

class ResultIQScreen extends StatelessWidget {
  final int iqResult;
  final String timeResult;
  const ResultIQScreen({
    super.key,
    required this.iqResult,
    required this.timeResult,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'You result IQ $iqResult',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'You result time $timeResult',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                context.go(
                    context.namedLocation(AppRouteConstants.welcomeRouteName));
              },
              child: const Text('Turn Back'),
            ),
            const Spacer(),
          ],
        ),
      )),
    );
  }
}
