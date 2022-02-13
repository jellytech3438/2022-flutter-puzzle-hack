part of 'game_bloc.dart';

class GameState {
  const GameState({
    this.puzzle = const Puzzle(tiles: []),
    this.puzzleStatus = PuzzleStatus.incomplete,
    // this.tileMovementStatus = TileMovementStatus.nothingTapped,
  });

  final Puzzle puzzle;

  final PuzzleStatus puzzleStatus;

  // final TileMovementStatus tileMovementStatus;

  GameState copyWith({
    Puzzle? puzzle,
    PuzzleStatus? puzzleStatus,
  }) {
    return GameState(
      puzzle: puzzle ?? this.puzzle,
      puzzleStatus: puzzleStatus ?? this.puzzleStatus
    );
  }
}

class ToNextLevelState extends GameState{
  ToNextLevelState(puzzle) : super(puzzle: puzzle);
}

class ChooseLevelState extends GameState{
  ChooseLevelState() : super();
}

class OptionPageState extends GameState{
  OptionPageState() : super();
}

