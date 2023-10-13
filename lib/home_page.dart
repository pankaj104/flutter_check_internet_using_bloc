import 'package:check_internet_using_bloc/Bloc/internet_bloc.dart';
import 'package:check_internet_using_bloc/Bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Internet"),
      ),
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetBackState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Connected!"),
                backgroundColor: Colors.yellow,
              ));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Lost!"),
                backgroundColor: Colors.grey,
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Internet Loading")));
            }
          },
          builder: (context, state) {
            return BlocBuilder<InternetBloc, InternetState>(
              builder: (context, state) {
                if (state is InternetBackState) {
                  return const Text("Connected");
                } else if (state is InternetLostState) {
                  return const Text("Not Connected");
                } else {
                  return const Text("Loading...");
                }
              },
            );
          },
        ),
      )),
    );
  }
}
