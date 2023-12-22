import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_iq/config/router/router_name.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth / 15,
                vertical: constraints.maxHeight / 20,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Text(
                      'Ready to Gauge Your IQ ? Welcome to the Test!',
                      textAlign: TextAlign.center,
                      style: textTheme.titleMedium,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        context.go(context.namedLocation(
                            AppRouteConstants.questionRouteName));
                      },
                      child: const Text('Start IQ Test'),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
