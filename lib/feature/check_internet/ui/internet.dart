import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter2/feature/check_internet/internet_bloc.dart';
import 'package:twitter2/feature/check_internet/internet_state.dart';

class InternetScreen extends StatelessWidget {
  const InternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is InternetConnectedState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("you are connected with internet")));
          } else if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("check internet connection")));
          }
        },
        builder: (context, state) {
          if (state is InternetConnectedState) {
            return Center(child: Text("Yes "));
          } else if (state is InternetLostState) {
            return Center(child: Text("no "));
          } else {
            return Container(
              child: Center(child: Text("error")),
            );
          }
        },
      ),
    );
  }
}
