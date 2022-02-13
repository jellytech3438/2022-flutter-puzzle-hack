part of 'game_bloc.dart';

class GameState {
  const GameState({
    this.puzzleStatus = PuzzleStatus.incomplete,
    // this.tileMovementStatus = TileMovementStatus.nothingTapped,
  });

  final PuzzleStatus puzzleStatus;

  // final TileMovementStatus tileMovementStatus;

  GameState copyWith({
    Puzzle? puzzle,
    PuzzleStatus? puzzleStatus,
  }) {
    return GameState(
      puzzleStatus: puzzleStatus ?? this.puzzleStatus
    );
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

