import 'package:bloc_cubit_tutorial/cubit/internet_cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/internet_cubit/internet_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.gainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Connected!'),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Not Connected!'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state == InternetState.gainedState) {
              return const Text('Connected!');
            } else if (state == InternetState.lostState) {
              return const Text('Not Connected!');
            } else {
              return const Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}
