part of 'game_bloc.dart';

@immutable
abstract class GameEvent extends Equatable{
  const GameEvent();

  @override
  List<Object> get props => [];
}

class GameInitialized extends GameEvent {
  GameInitialized();
}

class Option extends GameEvent{
  Option();
}

class ChooseLevel extends GameEvent{
  ChooseLevel();
}

class StartLevel extends GameEvent{
  StartLevel(this.chooseLevel,this.puzzleBloc);

  final int chooseLevel;
  final PuzzleBloc puzzleBloc;

  @override
  List<Object> get props => [chooseLevel];
}