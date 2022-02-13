import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:slide_puzzle/src/model/models.dart';

part 'puzzle_event.dart';
part 'puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  PuzzleBloc(this.level,this.leftmovesteps,this.tileMovementStatus,) : super(const PuzzleState()) {
    on<IsHome>(_onIsHome);
    on<PuzzleInitialized>(_onPuzzleInitialized);
    on<TileTapped>(_onTileTapped);
    on<TileUnTapped>(_onTileUnTapped);
    on<SwapTiles>(_onSwapTiles);
    on<SwapKingTiles>(_onSwapKinigTiles);
    on<PuzzleReset>(_onPuzzleReset);
    on<PuzzleLose>(_onPuzzleLose);
  }

  int level;

  int leftmovesteps;

  int? getStars;

  TileMovementStatus tileMovementStatus;

  Tile? tiletapped;

  Puzzle _generatePuzzle(){
    Puzzle puzzle = Puzzle(tiles: []);
    puzzle.initializeTiles(level);
    return puzzle;
  }

  void _onIsHome(IsHome event, Emitter<PuzzleState> emit){
    emit(
      IsHomeState()
    );
  }

  void _onPuzzleInitialized(PuzzleInitialized event, Emitter<PuzzleState> emit,) {
    this.level = event.level;
    final puzzle = _generatePuzzle();
    emit(
      PuzzleState(
        puzzle: puzzle,
      ),
    );
  }

  void _onTileTapped(TileTapped event, Emitter<PuzzleState> emit,){
    /// this event is the tile we put into TileTapped class
    final tappedTile = event.tile;
    tappedTile.tapped = true;
    print(tappedTile.currentPosition.x);
    print(tappedTile.currentPosition.y);
    print(this.state.puzzle.tiles[tappedTile.currentPosition.y][tappedTile.currentPosition.x]);

    int maxX = this.state.puzzle.tiles[0].length;
    int maxY = this.state.puzzle.tiles.length;
    print(maxX);
    print(maxY);

    if(tappedTile.value == ChessPieces.Pawn){
      Position p = tappedTile.currentPosition;
      if(p.x+1 < maxX){
        if(this.state.puzzle.tiles[p.y][p.x+1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y][p.x+1].tapped = true;
        }
      }
      if(p.x-1 >= 0){
        if(this.state.puzzle.tiles[p.y][p.x-1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y][p.x-1].tapped = true;
        }
      }
      if(p.y+1 < maxY){
        if(this.state.puzzle.tiles[p.y+1][p.x].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y+1][p.x].tapped = true;
        }
      }
      if(p.y-1 >= 0){
        if(this.state.puzzle.tiles[p.y-1][p.x].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y-1][p.x].tapped = true;
        }
      }
    }

    if(tappedTile.value == ChessPieces.Knight){
      Position p = tappedTile.currentPosition;
      if(p.y - 2 >= 0 && p.x - 1 >= 0){
        if(this.state.puzzle.tiles[p.y-2][p.x-1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y-2][p.x-1].tapped = true;
        }
      }
      if(p.y - 1 >= 0 && p.x - 2 >= 0){
        if(this.state.puzzle.tiles[p.y-1][p.x-2].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y-1][p.x-2].tapped = true;
        }
      }
      if(p.y + 1 < maxY && p.x - 2 >= 0){
        if(this.state.puzzle.tiles[p.y+1][p.x-2].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y+1][p.x-2].tapped = true;
        }
      }
      if(p.y + 2 < maxY && p.x - 1 >= 0){
        if(this.state.puzzle.tiles[p.y+2][p.x-1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y+2][p.x-1].tapped = true;
        }
      }
      if(p.y + 2 < maxY && p.x + 1 < maxX){
        if(this.state.puzzle.tiles[p.y+2][p.x+1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y+2][p.x+1].tapped = true;
        }
      }
      if(p.y + 1 < maxY && p.x + 2 < maxX){
        if(this.state.puzzle.tiles[p.y+1][p.x+2].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y+1][p.x+2].tapped = true;
        }
      }
      if(p.y - 1 >= 0 && p.x + 2 < maxX){
        if(this.state.puzzle.tiles[p.y-1][p.x+2].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y-1][p.x+2].tapped = true;
        }
      }
      if(p.y - 2 >= 0 && p.x + 1 < maxX){
        if(this.state.puzzle.tiles[p.y-2][p.x+1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y-2][p.x+1].tapped = true;
        }
      }
    }

    if(tappedTile.value == ChessPieces.Rook){
      Position p = tappedTile.currentPosition;
      int tempX = p.x;
      int tempY = p.y;

      while(tempX - 1 >= 0){
        if(this.state.puzzle.tiles[p.y][tempX-1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[p.y][tempX-1].tapped = true;
        }else{
          break;
        }
        tempX--;
      }

      while(tempY - 1 >= 0){
        if(this.state.puzzle.tiles[tempY-1][p.x].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY-1][p.x].tapped = true;
        }else{
          break;
        }
        tempY--;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX + 1 < maxX){
        if(this.state.puzzle.tiles[p.y][tempX+1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y][tempX+1].tapped = true;
        }else{
          break;
        }
        tempX++;
      }

      while(tempY + 1 < maxY){
        if(this.state.puzzle.tiles[tempY+1][p.x].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY+1][p.x].tapped = true;
        }else{
          break;
        }
        tempY++;
      }
    }

    if(tappedTile.value == ChessPieces.Bishop){
      Position p = tappedTile.currentPosition;
      int tempX = p.x;
      int tempY = p.y;
      while(tempX - 1 >= 0 && tempY - 1 >= 0){
        if(this.state.puzzle.tiles[tempY-1][tempX-1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY-1][tempX-1].tapped = true;
        }else{
          break;
        }
        tempX--;
        tempY--;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX - 1 >= 0 && tempY + 1 < maxY){
        if(this.state.puzzle.tiles[tempY+1][tempX-1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY+1][tempX-1].tapped = true;
        }else{
          break;
        }
        tempX--;
        tempY++;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX + 1 < maxX && tempY - 1 >= 0){
        if(this.state.puzzle.tiles[tempY-1][tempX+1].value == ChessPieces.Space){
          this.state.puzzle.tiles[tempY-1][tempX+1].tapped = true;
        }else{
          break;
        }
        tempX++;
        tempY--;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX + 1 < maxX && tempY + 1 < maxY){
        if(this.state.puzzle.tiles[tempY+1][tempX+1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY+1][tempX+1].tapped = true;
        }else{
          break;
        }
        tempX++;
        tempY++;
      }
    }

    if(tappedTile.value == ChessPieces.Queen){
      Position p = tappedTile.currentPosition;
      int tempX = p.x;
      int tempY = p.y;
      while(tempX - 1 >= 0 && tempY - 1 >= 0){
        if(this.state.puzzle.tiles[tempY-1][tempX-1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY-1][tempX-1].tapped = true;
        }else{
          break;
        }
        tempX--;
        tempY--;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX - 1 >= 0 && tempY + 1 < maxY){
        if(this.state.puzzle.tiles[tempY+1][tempX-1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY+1][tempX-1].tapped = true;
        }else{
          break;
        }
        tempX--;
        tempY++;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX + 1 < maxX && tempY - 1 >= 0){
        if(this.state.puzzle.tiles[tempY-1][tempX+1].value == ChessPieces.Space){
          this.state.puzzle.tiles[tempY-1][tempX+1].tapped = true;
        }else{
          break;
        }
        tempX++;
        tempY--;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX + 1 < maxX && tempY + 1 < maxY){
        if(this.state.puzzle.tiles[tempY+1][tempX+1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY+1][tempX+1].tapped = true;
        }else{
          break;
        }
        tempX++;
        tempY++;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX - 1 >= 0){
        if(this.state.puzzle.tiles[p.y][tempX-1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[p.y][tempX-1].tapped = true;
        }else{
          break;
        }
        tempX--;
      }

      while(tempY - 1 >= 0){
        if(this.state.puzzle.tiles[tempY-1][p.x].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY-1][p.x].tapped = true;
        }else{
          break;
        }
        tempY--;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX + 1 < maxX){
        if(this.state.puzzle.tiles[p.y][tempX+1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y][tempX+1].tapped = true;
        }else{
          break;
        }
        tempX++;
      }

      while(tempY + 1 < maxY){
        if(this.state.puzzle.tiles[tempY+1][p.x].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY+1][p.x].tapped = true;
        }else{
          break;
        }
        tempY++;
      }
    }

    if(tappedTile.value == ChessPieces.KingTopLeft){
      Position p = tappedTile.currentPosition;
      this.state.puzzle.tiles[p.y][p.x].tapped = true;
      this.state.puzzle.tiles[p.y][p.x+1].tapped = true;
      this.state.puzzle.tiles[p.y+1][p.x].tapped = true;
      this.state.puzzle.tiles[p.y+1][p.x+1].tapped = true;
    }
    if(tappedTile.value == ChessPieces.KingTopRight){
      Position p = tappedTile.currentPosition;
      this.state.puzzle.tiles[p.y][p.x].tapped = true;
      this.state.puzzle.tiles[p.y][p.x-1].tapped = true;
      this.state.puzzle.tiles[p.y+1][p.x].tapped = true;
      this.state.puzzle.tiles[p.y+1][p.x-1].tapped = true;
    }
    if(tappedTile.value == ChessPieces.KingButtomLeft){
      Position p = tappedTile.currentPosition;
      this.state.puzzle.tiles[p.y][p.x].tapped = true;
      this.state.puzzle.tiles[p.y][p.x+1].tapped = true;
      this.state.puzzle.tiles[p.y-1][p.x].tapped = true;
      this.state.puzzle.tiles[p.y-1][p.x+1].tapped = true;
    }
    if(tappedTile.value == ChessPieces.KingButtomRight){
      Position p = tappedTile.currentPosition;
      this.state.puzzle.tiles[p.y][p.x].tapped = true;
      this.state.puzzle.tiles[p.y][p.x-1].tapped = true;
      this.state.puzzle.tiles[p.y-1][p.x].tapped = true;
      this.state.puzzle.tiles[p.y-1][p.x-1].tapped = true;
    }

  }

  void _onTileUnTapped(TileUnTapped event, Emitter<PuzzleState> emit,){
    final tappedTile = event.tile;
    tappedTile.tapped = false;

    int maxX = this.state.puzzle.tiles[0].length;
    int maxY = this.state.puzzle.tiles.length;

    if(tappedTile.value == ChessPieces.Pawn){
      Position p = tappedTile.currentPosition;
      /// may out of size, NEED to be fix

      if(p.x+1 < maxX){
        if(this.state.puzzle.tiles[p.y][p.x+1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y][p.x+1].tapped = false;
        }
      }
      if(p.x-1 >= 0){
        if(this.state.puzzle.tiles[p.y][p.x-1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y][p.x-1].tapped = false;
        }
      }
      if(p.y+1 < maxY){
        if(this.state.puzzle.tiles[p.y+1][p.x].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y+1][p.x].tapped = false;
        }
      }
      if(p.y-1 >= 0){
        if(this.state.puzzle.tiles[p.y-1][p.x].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y-1][p.x].tapped = false;
        }
      }
    }

    if(tappedTile.value == ChessPieces.Knight){
      Position p = tappedTile.currentPosition;
      if(p.y - 2 >= 0 && p.x - 1 >= 0){
        if(this.state.puzzle.tiles[p.y-2][p.x-1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y-2][p.x-1].tapped = false;
        }
      }
      if(p.y - 1 >= 0 && p.x - 2 >= 0){
        if(this.state.puzzle.tiles[p.y-1][p.x-2].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y-1][p.x-2].tapped = false;
        }
      }
      if(p.y + 1 < maxY && p.x - 2 >= 0){
        if(this.state.puzzle.tiles[p.y+1][p.x-2].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y+1][p.x-2].tapped = false;
        }
      }
      if(p.y + 2 < maxY && p.x - 1 >= 0){
        if(this.state.puzzle.tiles[p.y+2][p.x-1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y+2][p.x-1].tapped = false;
        }
      }
      if(p.y + 2 < maxY && p.x + 1 < maxX){
        if(this.state.puzzle.tiles[p.y+2][p.x+1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y+2][p.x+1].tapped = false;
        }
      }
      if(p.y + 1 < maxY && p.x + 2 < maxX){
        if(this.state.puzzle.tiles[p.y+1][p.x+2].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y+1][p.x+2].tapped = false;
        }
      }
      if(p.y - 1 >= 0 && p.x + 2 < maxX){
        if(this.state.puzzle.tiles[p.y-1][p.x+2].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y-1][p.x+2].tapped = false;
        }
      }
      if(p.y - 2 >= 0 && p.x + 1 < maxX){
        if(this.state.puzzle.tiles[p.y-2][p.x+1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y-2][p.x+1].tapped = false;
        }
      }
    }

    if(tappedTile.value == ChessPieces.Rook){
      Position p = tappedTile.currentPosition;
      int tempX = p.x;
      int tempY = p.y;

      while(tempX - 1 >= 0){
        if(this.state.puzzle.tiles[p.y][tempX-1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[p.y][tempX-1].tapped = false;
        }else{
          break;
        }
        tempX--;
      }

      while(tempY - 1 >= 0){
        if(this.state.puzzle.tiles[tempY-1][p.x].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY-1][p.x].tapped = false;
        }else{
          break;
        }
        tempY--;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX + 1 < maxX){
        if(this.state.puzzle.tiles[p.y][tempX+1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y][tempX+1].tapped = false;
        }else{
          break;
        }
        tempX++;
      }

      while(tempY + 1 < maxY){
        if(this.state.puzzle.tiles[tempY+1][p.x].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY+1][p.x].tapped = false;
        }else{
          break;
        }
        tempY++;
      }
    }

    if(tappedTile.value == ChessPieces.Bishop){
      Position p = tappedTile.currentPosition;
      int tempX = p.x;
      int tempY = p.y;
      while(tempX - 1 >= 0 && tempY - 1 >= 0){
        if(this.state.puzzle.tiles[tempY-1][tempX-1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY-1][tempX-1].tapped = false;
        }else{
          break;
        }
        tempX--;
        tempY--;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX - 1 >= 0 && tempY + 1 < maxY){
        if(this.state.puzzle.tiles[tempY+1][tempX-1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY+1][tempX-1].tapped = false;
        }else{
          break;
        }
        tempX--;
        tempY++;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX + 1 < maxX && tempY - 1 >= 0){
        if(this.state.puzzle.tiles[tempY-1][tempX+1].value == ChessPieces.Space){
          this.state.puzzle.tiles[tempY-1][tempX+1].tapped = false;
        }else{
          break;
        }
        tempX++;
        tempY--;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX + 1 < maxX && tempY + 1 < maxY){
        if(this.state.puzzle.tiles[tempY+1][tempX+1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY+1][tempX+1].tapped = false;
        }else{
          break;
        }
        tempX++;
        tempY++;
      }
    }

    if(tappedTile.value == ChessPieces.Queen){
      Position p = tappedTile.currentPosition;
      int tempX = p.x;
      int tempY = p.y;
      while(tempX - 1 >= 0 && tempY - 1 >= 0){
        if(this.state.puzzle.tiles[tempY-1][tempX-1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY-1][tempX-1].tapped = false;
        }else{
          break;
        }
        tempX--;
        tempY--;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX - 1 >= 0 && tempY + 1 < maxY){
        if(this.state.puzzle.tiles[tempY+1][tempX-1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY+1][tempX-1].tapped = false;
        }else{
          break;
        }
        tempX--;
        tempY++;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX + 1 < maxX && tempY - 1 >= 0){
        if(this.state.puzzle.tiles[tempY-1][tempX+1].value == ChessPieces.Space){
          this.state.puzzle.tiles[tempY-1][tempX+1].tapped = false;
        }else{
          break;
        }
        tempX++;
        tempY--;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX + 1 < maxX && tempY + 1 < maxY){
        if(this.state.puzzle.tiles[tempY+1][tempX+1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY+1][tempX+1].tapped = false;
        }else{
          break;
        }
        tempX++;
        tempY++;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX - 1 >= 0){
        if(this.state.puzzle.tiles[p.y][tempX-1].value == ChessPieces.Space) {
          this.state.puzzle.tiles[p.y][tempX-1].tapped = false;
        }else{
          break;
        }
        tempX--;
      }

      while(tempY - 1 >= 0){
        if(this.state.puzzle.tiles[tempY-1][p.x].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY-1][p.x].tapped = false;
        }else{
          break;
        }
        tempY--;
      }

      tempX = p.x;
      tempY = p.y;

      while(tempX + 1 < maxX){
        if(this.state.puzzle.tiles[p.y][tempX+1].value == ChessPieces.Space){
          this.state.puzzle.tiles[p.y][tempX+1].tapped = false;
        }else{
          break;
        }
        tempX++;
      }

      while(tempY + 1 < maxY){
        if(this.state.puzzle.tiles[tempY+1][p.x].value == ChessPieces.Space) {
          this.state.puzzle.tiles[tempY+1][p.x].tapped = false;
        }else{
          break;
        }
        tempY++;
      }
    }

    if(tappedTile.value == ChessPieces.KingTopLeft){
      Position p = tappedTile.currentPosition;
      this.state.puzzle.tiles[p.y][p.x].tapped = false;
      this.state.puzzle.tiles[p.y][p.x+1].tapped = false;
      this.state.puzzle.tiles[p.y+1][p.x].tapped = false;
      this.state.puzzle.tiles[p.y+1][p.x+1].tapped = false;
    }
    if(tappedTile.value == ChessPieces.KingTopRight){
      Position p = tappedTile.currentPosition;
      this.state.puzzle.tiles[p.y][p.x].tapped = false;
      this.state.puzzle.tiles[p.y][p.x-1].tapped = false;
      this.state.puzzle.tiles[p.y+1][p.x].tapped = false;
      this.state.puzzle.tiles[p.y+1][p.x-1].tapped = false;
    }
    if(tappedTile.value == ChessPieces.KingButtomLeft){
      Position p = tappedTile.currentPosition;
      this.state.puzzle.tiles[p.y][p.x].tapped = false;
      this.state.puzzle.tiles[p.y][p.x+1].tapped = false;
      this.state.puzzle.tiles[p.y-1][p.x].tapped = false;
      this.state.puzzle.tiles[p.y-1][p.x+1].tapped = false;
    }
    if(tappedTile.value == ChessPieces.KingButtomRight){
      Position p = tappedTile.currentPosition;
      this.state.puzzle.tiles[p.y][p.x].tapped = false;
      this.state.puzzle.tiles[p.y][p.x-1].tapped = false;
      this.state.puzzle.tiles[p.y-1][p.x].tapped = false;
      this.state.puzzle.tiles[p.y-1][p.x-1].tapped = false;
    }

  }

  void _onSwapTiles(SwapTiles event,Emitter<PuzzleState> emit){
    final previoustiled = event.tappedtile;
    final tappedtile = event.nexttile;

    this.state.puzzle.tiles[previoustiled.currentPosition.y][previoustiled.currentPosition.x] = tappedtile.copyWith(currentPosition: previoustiled.currentPosition);
    this.state.puzzle.tiles[tappedtile.currentPosition.y][tappedtile.currentPosition.x] = previoustiled.copyWith(currentPosition: tappedtile.currentPosition);;
    this.state.puzzle.tiles[previoustiled.currentPosition.y][previoustiled.currentPosition.x].tapped = false;
    this.state.puzzle.tiles[tappedtile.currentPosition.y][tappedtile.currentPosition.x].tapped = false;

    this.leftmovesteps--;
    if(this.leftmovesteps <= 0){
      this.add(PuzzleLose());
    }
  }

  void _onSwapKinigTiles(SwapKingTiles event , Emitter<PuzzleState> emit){
    /// implement swap king event handler
    final kingtopleft = event.kingtile[0];
    final kingtopright = event.kingtile[0];
    final kingbuttomleft = event.kingtile[0];
    final kingbuttomright = event.kingtile[0];
    final tappedtile = event.nexttile;
    final tiles = this.state.puzzle.tiles;

    if(tappedtile.value == ChessPieces.End){
      this.add(PuzzleWin());
    }else{

      for(Tile king in event.kingtile){
        /// how do i know the move direction???
      }



      // if(kingtiled.value == ChessPieces.KingTopLeft){
      //   this.state.puzzle.tiles[kingtiled.currentPosition.y][kingtiled.currentPosition.x] = tappedtile.copyWith(currentPosition: kingtiled.currentPosition);
      //   this.state.puzzle.tiles[kingtiled.currentPosition.y+1][kingtiled.currentPosition.x] = tappedtile.copyWith(currentPosition: tiles[kingtiled.currentPosition.y+1][kingtiled.currentPosition.x].currentPosition);
      //   this.state.puzzle.tiles[tappedtile.currentPosition.y][tappedtile.currentPosition.x+1] = kingtiled.copyWith(currentPosition: tiles[kingtiled.currentPosition.y][kingtiled.currentPosition.x+1].currentPosition);
      //   this.state.puzzle.tiles[tappedtile.currentPosition.y+1][tappedtile.currentPosition.x+1] = kingtiled.copyWith(currentPosition: tiles[kingtiled.currentPosition.y][kingtiled.currentPosition.x+1].currentPosition);
      //
      //   this.state.puzzle.tiles[kingtiled.currentPosition.y][kingtiled.currentPosition.x].tapped = false;
      //   this.state.puzzle.tiles[tappedtile.currentPosition.y][tappedtile.currentPosition.x].tapped = false;
      // }
    }
  }

  void _onPuzzleReset(PuzzleReset event,Emitter<PuzzleState> emit){
    final puzzle = _generatePuzzle();
    emit(
      PuzzleState(
        puzzle: puzzle,
      ),
    );
  }

  void _onPuzzleLose(PuzzleLose event,Emitter<PuzzleState> emit){
    emit(
      PuzzleLoseState(),
    );
  }
}
