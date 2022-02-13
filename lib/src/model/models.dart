import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// enemy king is to get point(eatable piece so )
enum ChessPieces{
  King,Queen,Rook,Bishop,Knight,Pawn,
  Space,
  End,
  EnemyKing,
  KingTopLeft,KingButtomLeft,KingTopRight,KingButtomRight
}

class Position extends Equatable implements Comparable<Position> {
  const Position({required this.x, required this.y});

  final int x;
  final int y;

  @override
  List<Object> get props => [x, y];

  @override
  int compareTo(Position other) {
    /// in the official setting, the position compare y first and then x
    if (y < other.y) {
      return -1;
    } else if (y > other.y) {
      return 1;
    } else {
      if (x < other.x) {
        return -1;
      } else if (x > other.x) {
        return 1;
      } else {
        return 0;
      }
    }
  }

  bool isEven(){
    return (x + y) % 2 == 0 ? true : false;
  }
}

class Tile extends Equatable {
  Tile({
    required this.value,
    required this.currentPosition,
    this.tapped = false,
    this.hovered = false,
  });

  final ChessPieces value;

  final Position currentPosition;

  late bool tapped;

  late bool hovered;

  Tile copyWith({required Position currentPosition}) {
    return Tile(
      value: value,
      currentPosition: currentPosition,
      tapped: tapped,
      hovered: hovered,
    );
  }

  bool isKing(){
    if(this.value == ChessPieces.KingTopLeft || this.value == ChessPieces.KingTopRight || this.value == ChessPieces.KingButtomLeft || this.value == ChessPieces.KingButtomRight){
      return true;
    }
    return false;
  }

  @override
  List<Object> get props => [
    value,
    currentPosition,
  ];
}

class Puzzle{
  const Puzzle({required this.tiles});

  final List<List<Tile>> tiles;

  void initializeTiles(int level){
    tiles.clear();
    switch(level){
      case 1:
        tiles.add([
          Tile(value: ChessPieces.KingTopLeft, currentPosition: Position(x: 0,y: 0)),
          Tile(value: ChessPieces.KingTopRight, currentPosition: Position(x: 1,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 0)),
        ]);
        tiles.add([
          Tile(value: ChessPieces.KingButtomLeft, currentPosition: Position(x: 0,y: 1)),
          Tile(value: ChessPieces.KingButtomRight, currentPosition: Position(x: 1,y: 1)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 1)),
        ]);
        tiles.add([
          Tile(value: ChessPieces.Knight, currentPosition: Position(x: 0,y: 2)),
          Tile(value: ChessPieces.Rook, currentPosition: Position(x: 1,y: 2)),
          Tile(value: ChessPieces.Bishop, currentPosition: Position(x: 2,y: 2)),
        ]);
        tiles.add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 3)),
        ]);
        tiles.add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 4)),
        ]);
        tiles.add([
          Tile(value: ChessPieces.End, currentPosition: Position(x: 0,y: 5)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 1,y: 5)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 5)),
        ]);
        break;
      case 2:
        tiles.add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 0)),
        ]);
        tiles.add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 1)),
          Tile(value: ChessPieces.Queen, currentPosition: Position(x: 1,y: 1)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 1)),
        ]);
        tiles.add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 2)),
        ]);
        tiles.add([
          Tile(value: ChessPieces.End, currentPosition: Position(x: 0,y: 3)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 1,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 3)),
        ]);
        break;
    }
  }

}

enum PuzzleStatus { incomplete, complete }

enum TileMovementStatus { nothingTapped, tapped, cannotBeMoved, moved }

enum ScreenViewType {tutorialView, controlView, completeView}

class ChessImage extends StatelessWidget {

  ChessImage(this.chessPieces);

  final ChessPieces chessPieces;

  @override
  Widget build(BuildContext context) {
    if(chessPieces == ChessPieces.Pawn){
      return Image.asset(
        'lib/assets/BlackPawn.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.Bishop){
      return Image.asset(
        'lib/assets/BlackBishop.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.Knight){
      return Image.asset(
        'lib/assets/BlackKnight.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.Queen){
      return Image.asset(
        'lib/assets/BlackQueen.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.Rook){
      return Image.asset(
        'lib/assets/BlackRook.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.KingTopLeft){
      // still in progress
      return Image.asset(
        'lib/assets/BlackKingTopLeft.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.KingTopRight){
      // still in progress
      return Image.asset(
        'lib/assets/BlackKingTopRight.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.KingButtomLeft){
      // still in progress;
      return Image.asset(
        'lib/assets/BlackKingButtomLeft.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.KingButtomRight){
      // still in progress
      return Image.asset(
        'lib/assets/BlackKingButtomRight.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.Space){
      return Container();
    }else if(chessPieces == ChessPieces.End){
      return Icon(Icons.flag,size: 50,);
    }

    return CircularProgressIndicator();
  }
}

enum NextDirection{Left,Right,Top,Bottom}