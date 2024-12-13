import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

enum Team { A, B }

class CounterCubit extends Cubit<CounterState> {
  int teamAPoints = 0;
  int teamBPoints = 0;

  CounterCubit() : super(InitialState());

  void incrementPoints(Team team, int pointsToAdd) {
    if (team == Team.A) {
      teamAPoints += pointsToAdd;
      emit(TeamAIncrement());
    } else if (team == Team.B) {
      teamBPoints += pointsToAdd;
      emit(TeamBIncrement());
    }
  }

  void resetPoints() {
    teamAPoints = 0;
    teamBPoints = 0;
    emit(TeamReset(teamAPoints: teamAPoints, teamBPoints: teamBPoints));
  }
}
