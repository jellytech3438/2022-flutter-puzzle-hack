part of 'puzzle_bloc.dart';

@immutable
abstract class PuzzleEvent {}

class PuzzleInitialized extends PuzzleEvent {
  PuzzleInitialized(this.level);

  final int level;

  @override
  List<Object> get props => [level];
}

class TileTapped extends PuzzleEvent {
  TileTapped(this.tile);

  final Tile tile;

  @override
  List<Object> get props => [tile];
}

class TileUnTapped extends PuzzleEvent {
  TileUnTapped(this.tile);

  final Tile tile;

  @override
  List<Object> get props => [tile];
}

class SwapTiles extends PuzzleEvent {
  SwapTiles(this.tappedtile,this.nexttile);

  final Tile tappedtile;
  final Tile nexttile;

  @override
  List<Object> get props => [tappedtile,nexttile];
}

class SwapKingTiles extends PuzzleEvent{
  SwapKingTiles(this.kingtile,this.nexttile);

  /// 0 : TopLeft
  /// 1 : TopRight
  /// 2 : ButtomLeft
  /// 3 : ButtomRight
  final List<Tile> kingtile;
  final Tile nexttile;

  @override
  List<Object> get props => [kingtile,nexttile];

}

class PuzzleReset extends PuzzleEvent{
  PuzzleReset();
}

class PuzzleLose extends PuzzleEvent{
  PuzzleLose();
}

class PuzzleWin extends PuzzleEvent{
  PuzzleWin();
}

class IsHome extends PuzzleEvent{
  IsHome();
}
