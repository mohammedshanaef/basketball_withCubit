import 'package:basketball_app/cubit/counter_cubit.dart';
import 'package:basketball_app/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BasketApp());
}

class BasketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<CounterCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.teal,
            title: const Text(
              "Points Counter",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTeamColumn(context, Team.A, cubit.teamAPoints),
                  const SizedBox(
                    height: 450,
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  ),
                  buildTeamColumn(context, Team.B, cubit.teamBPoints),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                onPressed: () => context.read<CounterCubit>().resetPoints(),
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ///// Builds a column for a specific team
  Widget buildTeamColumn(BuildContext context, Team team, int points) {
    return Column(
      children: [
        Text(
          "Team ${team == Team.A ? 'A' : 'B'}",
          style: const TextStyle(fontSize: 32),
        ),
        Text(
          "$points",
          style: const TextStyle(fontSize: 150),
        ),
        buildPointButton(context, team, 1),
        const SizedBox(height: 30),
        buildPointButton(context, team, 2),
        const SizedBox(height: 30),
        buildPointButton(context, team, 3),
      ],
    );
  }

  /// Builds a button to add points for a specific team
  Widget buildPointButton(BuildContext context, Team team, int pointsToAdd) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
      ),
      onPressed: () {
        context.read<CounterCubit>().incrementPoints(team, pointsToAdd);
      },
      child: Text(
        "Add $pointsToAdd Point${pointsToAdd > 1 ? 's' : ''}",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
