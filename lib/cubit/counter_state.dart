abstract class CounterState {}

class InitialState extends CounterState {}

class TeamAIncrement extends CounterState {}

class TeamBIncrement extends CounterState {}

class TeamReset extends CounterState {
  final int teamAPoints;
  final int teamBPoints;

  TeamReset({required this.teamAPoints, required this.teamBPoints});
}
