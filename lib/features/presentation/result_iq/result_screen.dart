import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_iq/core/bloc/iq_counter_bloc.dart';

class ResultIQScreen extends StatelessWidget {
  const ResultIQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<IqCounterBloc, IqCounterState>(
            builder: (BuildContext context, IqCounterState state) {
              return Center(
                child: Column(children: [
                  Text(
                    'You result IQ ${state.iqCounter}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
