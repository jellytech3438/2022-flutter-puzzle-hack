part of 'game_bloc.dart';

class GameState {
  const GameState();

  GameState copyWith() {
    return GameState();
  }
}

class ToNextLevelState extends GameState{
  ToNextLevelState() : super();
}

class ChooseLevelState extends GameState{
  ChooseLevelState() : super();
}

class OptionPageState extends GameState{
  OptionPageState() : super();
}

