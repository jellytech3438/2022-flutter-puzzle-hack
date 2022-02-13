part of 'puzzle_bloc.dart';

@immutable
class PuzzleState {
  const PuzzleState({
    this.puzzle = const Puzzle(tiles: []),
    this.puzzleStatus = PuzzleStatus.incomplete,
    // this.tileMovementStatus = TileMovementStatus.nothingTapped,
  });

  final Puzzle puzzle;

  final PuzzleStatus puzzleStatus;

  // final TileMovementStatus tileMovementStatus;

  PuzzleState copyWith({
    Puzzle? puzzle,
    PuzzleStatus? puzzleStatus,
  }) {
    return PuzzleState(
        puzzle: puzzle ?? this.puzzle,
        puzzleStatus: puzzleStatus ?? this.puzzleStatus
    );
  }
}

class IsHomeState extends PuzzleState{
  IsHomeState() : super();
}

class PuzzleLoseState extends PuzzleState{
  PuzzleLoseState() : super();
}
