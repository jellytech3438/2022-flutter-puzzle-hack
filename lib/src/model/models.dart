import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ChessPieces{
  King,Queen,Rook,Bishop,Knight,Pawn,
  Space,
  Block,
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

  Tile trunToSpace(){
    return Tile(
      value: ChessPieces.Space,
      currentPosition: currentPosition,
      tapped: tapped,
      hovered: hovered,
    );
  }

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
    /// level 3 and 4 may need to redesign
    tiles.clear();
    switch(level){
      case 0:
        tiles
        ..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 0)),
          Tile(value: ChessPieces.Pawn, currentPosition: Position(x: 4,y: 0)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 1)),
          Tile(value: ChessPieces.KingTopLeft, currentPosition: Position(x: 1,y: 1)),
          Tile(value: ChessPieces.KingTopRight, currentPosition: Position(x: 2,y: 1)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 1)),
          Tile(value: ChessPieces.Knight, currentPosition: Position(x: 4,y: 1)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 2)),
          Tile(value: ChessPieces.KingButtomLeft, currentPosition: Position(x: 1,y: 2)),
          Tile(value: ChessPieces.KingButtomRight, currentPosition: Position(x: 2,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 2)),
          Tile(value: ChessPieces.Bishop, currentPosition: Position(x: 4,y: 2)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 3)),
          Tile(value: ChessPieces.Rook, currentPosition: Position(x: 4,y: 3)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 4)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 2,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 4)),
          Tile(value: ChessPieces.Queen, currentPosition: Position(x: 4,y: 4)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 5)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 5)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 5)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 5)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 4,y: 5)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 6)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 6)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 6)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 6)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 4,y: 6)),
        ])..add([
          Tile(value: ChessPieces.End, currentPosition: Position(x: 0,y: 7)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 1,y: 7)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 2,y: 7)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 3,y: 7)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 7)),
        ]);
        break;
      case 1:
        tiles..add([
          Tile(value: ChessPieces.KingTopLeft, currentPosition: Position(x: 0,y: 0)),
          Tile(value: ChessPieces.KingTopRight, currentPosition: Position(x: 1,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 0)),
        ])..add([
          Tile(value: ChessPieces.KingButtomLeft, currentPosition: Position(x: 0,y: 1)),
          Tile(value: ChessPieces.KingButtomRight, currentPosition: Position(x: 1,y: 1)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 1)),
        ])..add([
          Tile(value: ChessPieces.Knight, currentPosition: Position(x: 0,y: 2)),
          Tile(value: ChessPieces.Rook, currentPosition: Position(x: 1,y: 2)),
          Tile(value: ChessPieces.Bishop, currentPosition: Position(x: 2,y: 2)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 3)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 4)),
        ])..add([
          Tile(value: ChessPieces.End, currentPosition: Position(x: 0,y: 5)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 1,y: 5)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 5)),
        ]);
        break;
      case 2:
        tiles..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 0)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 0)),
          Tile(value: ChessPieces.KingTopLeft, currentPosition: Position(x: 2,y: 0)),
          Tile(value: ChessPieces.KingTopRight, currentPosition: Position(x: 3,y: 0)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 0)),
        ])..add([
          Tile(value: ChessPieces.Bishop, currentPosition: Position(x: 0,y: 1)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 1)),
          Tile(value: ChessPieces.KingButtomLeft, currentPosition: Position(x: 2,y: 1)),
          Tile(value: ChessPieces.KingButtomRight, currentPosition: Position(x: 3,y: 1)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 1)),
        ])..add([
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 0,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 2)),
          Tile(value: ChessPieces.Pawn, currentPosition: Position(x: 2,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 2)),
          Tile(value: ChessPieces.Rook, currentPosition: Position(x: 4,y: 2)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 3)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 4,y: 3)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 4)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 4,y: 4)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 5)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 5)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 2,y: 5)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 3,y: 5)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 4,y: 5)),
        ]);
        break;
      case 3:
        tiles..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 0)),
          Tile(value: ChessPieces.Bishop, currentPosition: Position(x: 1,y: 0)),
          Tile(value: ChessPieces.KingTopLeft, currentPosition: Position(x: 2,y: 0)),
          Tile(value: ChessPieces.KingTopRight, currentPosition: Position(x: 3,y: 0)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 0)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 5,y: 0)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 1)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 1)),
          Tile(value: ChessPieces.KingButtomLeft, currentPosition: Position(x: 2,y: 1)),
          Tile(value: ChessPieces.KingButtomRight, currentPosition: Position(x: 3,y: 1)),
          Tile(value: ChessPieces.Bishop, currentPosition: Position(x: 4,y: 1)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 5,y: 1)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 2)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 2)),
          Tile(value: ChessPieces.Pawn, currentPosition: Position(x: 3,y: 2)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 2)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 5,y: 2)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 3)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 4,y: 3)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 5,y: 3)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 4)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 4)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 5,y: 4)),
        ])..add([
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 0,y: 5)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 5)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 5)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 5)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 5)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 5,y: 5)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 6)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 6)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 2,y: 6)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 3,y: 6)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 6)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 5,y: 6)),
        ]);
        break;
      case 4:
        tiles..add([
          Tile(value: ChessPieces.Queen, currentPosition: Position(x: 0,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 0)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 3,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 4,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 5,y: 0)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 1)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 1)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 1)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 1)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 4,y: 1)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 5,y: 1)),
        ])..add([
          Tile(value: ChessPieces.KingTopLeft, currentPosition: Position(x: 0,y: 2)),
          Tile(value: ChessPieces.KingTopRight, currentPosition: Position(x: 1,y: 2)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 2,y: 2)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 3,y: 2)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 4,y: 2)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 5,y: 2)),
        ])..add([
          Tile(value: ChessPieces.KingButtomLeft, currentPosition: Position(x: 0,y: 3)),
          Tile(value: ChessPieces.KingButtomRight, currentPosition: Position(x: 1,y: 3)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 2,y: 3)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 3,y: 3)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 4,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 5,y: 3)),
        ])..add([
          Tile(value: ChessPieces.Queen, currentPosition: Position(x: 0,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 4)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 3,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 4,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 5,y: 4)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 5)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 5)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 5)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 5)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 4,y: 5)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 5,y: 5)),
        ]);
        break;
      case 5:
        tiles..add([
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 0,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 0)),
          Tile(value: ChessPieces.KingTopLeft, currentPosition: Position(x: 2,y: 0)),
          Tile(value: ChessPieces.KingTopRight, currentPosition: Position(x: 3,y: 0)),
          Tile(value: ChessPieces.Rook, currentPosition: Position(x: 4,y: 0)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 1)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 1)),
          Tile(value: ChessPieces.KingButtomLeft, currentPosition: Position(x: 2,y: 1)),
          Tile(value: ChessPieces.KingButtomRight, currentPosition: Position(x: 3,y: 1)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 4,y: 1)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 2)),
          Tile(value: ChessPieces.Knight, currentPosition: Position(x: 3,y: 2)),
          Tile(value: ChessPieces.Bishop, currentPosition: Position(x: 4,y: 2)),
        ])..add([
          Tile(value: ChessPieces.Queen, currentPosition: Position(x: 0,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 4,y: 3)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 4)),
          Tile(value: ChessPieces.Pawn, currentPosition: Position(x: 1,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 4)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 3,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 4,y: 4)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 5)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 1,y: 5)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 2,y: 5)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 3,y: 5)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 5)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 6)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 1,y: 6)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 2,y: 6)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 3,y: 6)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 6)),
        ]);
        break;
      case 6:
        tiles..add([
          Tile(value: ChessPieces.Pawn, currentPosition: Position(x: 0,y: 0)),
          Tile(value: ChessPieces.Knight, currentPosition: Position(x: 1,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 0)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 1)),
          Tile(value: ChessPieces.KingTopLeft, currentPosition: Position(x: 1,y: 1)),
          Tile(value: ChessPieces.KingTopRight, currentPosition: Position(x: 2,y: 1)),
        ])..add([
          Tile(value: ChessPieces.Pawn, currentPosition: Position(x: 0,y: 2)),
          Tile(value: ChessPieces.KingButtomLeft, currentPosition: Position(x: 1,y: 2)),
          Tile(value: ChessPieces.KingButtomRight, currentPosition: Position(x: 2,y: 2)),
        ])..add([
          Tile(value: ChessPieces.Pawn, currentPosition: Position(x: 0,y: 3)),
          Tile(value: ChessPieces.Pawn, currentPosition: Position(x: 1,y: 3)),
          Tile(value: ChessPieces.Pawn, currentPosition: Position(x: 2,y: 3)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 4)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 1,y: 4)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 2,y: 4)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 5)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 1,y: 5)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 2,y: 5)),
        ])..add([
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 0,y: 6)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 6)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 2,y: 6)),
        ]);
        break;
      case 7:
        tiles..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 0)),
          Tile(value: ChessPieces.KingTopLeft, currentPosition: Position(x: 1,y: 0)),
          Tile(value: ChessPieces.KingTopRight, currentPosition: Position(x: 2,y: 0)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 3,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 4,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 5,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 6,y: 0)),

        ])..add([
          Tile(value: ChessPieces.Knight, currentPosition: Position(x: 0,y: 1)),
          Tile(value: ChessPieces.KingButtomLeft, currentPosition: Position(x: 1,y: 1)),
          Tile(value: ChessPieces.KingButtomRight, currentPosition: Position(x: 2,y: 1)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 3,y: 1)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 4,y: 1)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 5,y: 1)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 6,y: 1)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 2)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 3,y: 2)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 4,y: 2)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 5,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 6,y: 2)),
        ])..add([
          Tile(value: ChessPieces.Rook, currentPosition: Position(x: 0,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 3)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 3,y: 3)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 3)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 5,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 6,y: 3)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 4,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 5,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 6,y: 4)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 5)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 1,y: 5)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 2,y: 5)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 3,y: 5)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 5)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 5,y: 5)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 6,y: 5)),
        ]);
        break;
      case 8:
        tiles..add([
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 0,y: 0)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 1,y: 0)),
          Tile(value: ChessPieces.KingTopLeft, currentPosition: Position(x: 2,y: 0)),
          Tile(value: ChessPieces.KingTopRight, currentPosition: Position(x: 3,y: 0)),

        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 1)),
          Tile(value: ChessPieces.Pawn, currentPosition: Position(x: 1,y: 1)),
          Tile(value: ChessPieces.KingButtomLeft, currentPosition: Position(x: 2,y: 1)),
          Tile(value: ChessPieces.KingButtomRight, currentPosition: Position(x: 3,y: 1)),
        ])..add([
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 0,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 2)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 2,y: 2)),
          Tile(value: ChessPieces.Pawn, currentPosition: Position(x: 3,y: 2)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 3)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 1,y: 3)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 3)),
          Tile(value: ChessPieces.Bishop, currentPosition: Position(x: 3,y: 3)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 4)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 4)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 2,y: 4)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 3,y: 4)),
        ]);
        break;
      case 9:
        tiles..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 0)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 1,y: 0)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 2,y: 0)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 3,y: 0)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 0)),
        ])..add([
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 0,y: 1)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 1,y: 1)),
          Tile(value: ChessPieces.KingTopLeft, currentPosition: Position(x: 2,y: 1)),
          Tile(value: ChessPieces.KingTopRight, currentPosition: Position(x: 3,y: 1)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 1)),
        ])..add([
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 0,y: 2)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 1,y: 2)),
          Tile(value: ChessPieces.KingButtomLeft, currentPosition: Position(x: 2,y: 2)),
          Tile(value: ChessPieces.KingButtomRight, currentPosition: Position(x: 3,y: 2)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 4,y: 2)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 3)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 1,y: 3)),
          Tile(value: ChessPieces.Knight, currentPosition: Position(x: 2,y: 3)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 3,y: 3)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 3)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 4)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 1,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 4)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 3,y: 4)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 4)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 5)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 5)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 2,y: 5)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 3,y: 5)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 5)),
        ]);
        break;
      case 10:
        tiles..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 0)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 0)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 2,y: 0)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 0)),
          Tile(value: ChessPieces.KingTopLeft, currentPosition: Position(x: 4,y: 0)),
          Tile(value: ChessPieces.KingTopRight, currentPosition: Position(x: 5,y: 0)),
        ])..add([
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 0,y: 1)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 1,y: 1)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 2,y: 1)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 1)),
          Tile(value: ChessPieces.KingButtomLeft, currentPosition: Position(x: 4,y: 1)),
          Tile(value: ChessPieces.KingButtomRight, currentPosition: Position(x: 5,y: 1)),
        ])..add([
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 0,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 1,y: 2)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 2,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 3,y: 2)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 4,y: 2)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 5,y: 2)),
        ])..add([
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 0,y: 3)),
          Tile(value: ChessPieces.Pawn, currentPosition: Position(x: 1,y: 3)),
          Tile(value: ChessPieces.Knight, currentPosition: Position(x: 2,y: 3)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 3,y: 3)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 4,y: 3)),
          Tile(value: ChessPieces.End, currentPosition: Position(x: 5,y: 3)),
        ])..add([
          Tile(value: ChessPieces.Queen, currentPosition: Position(x: 0,y: 4)),
          Tile(value: ChessPieces.EnemyKing, currentPosition: Position(x: 1,y: 4)),
          Tile(value: ChessPieces.Space, currentPosition: Position(x: 2,y: 4)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 3,y: 4)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 4,y: 4)),
          Tile(value: ChessPieces.Block, currentPosition: Position(x: 5,y: 4)),
        ]);
        break;
    }
  }

}

enum PuzzleStatus { incomplete, complete }

enum TileMovementStatus { nothingTapped, tapped, cannotBeMoved, moved }

class ChessImage extends StatelessWidget {

  ChessImage(this.chessPieces,this.isBlack);

  final ChessPieces chessPieces;

  final bool isBlack;

  @override
  Widget build(BuildContext context) {
    if(chessPieces == ChessPieces.Pawn){
      return isBlack ? Image.asset(
        'lib/assets/BlackPawn.png',
        width: 256,
        height: 256,
      ):
      Image.asset(
        'lib/assets/WhitePawn.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.Bishop){
      return isBlack ? Image.asset(
        'lib/assets/BlackBishop.png',
        width: 256,
        height: 256,
      ):
      Image.asset(
        'lib/assets/WhiteBishop.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.Knight){
      return isBlack ? Image.asset(
        'lib/assets/BlackKnight.png',
        width: 256,
        height: 256,
      ):
      Image.asset(
        'lib/assets/WhiteKnight.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.Queen){
      return isBlack ? Image.asset(
        'lib/assets/BlackQueen.png',
        width: 256,
        height: 256,
      ):
      Image.asset(
        'lib/assets/WhiteQueen.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.Rook){
      return isBlack ? Image.asset(
        'lib/assets/BlackRook.png',
        width: 256,
        height: 256,
      ):
      Image.asset(
        'lib/assets/WhiteRook.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.KingTopLeft){
      return isBlack ? Image.asset(
        'lib/assets/BlackKingTopLeft.png',
        width: 256,
        height: 256,
      ):
      Image.asset(
        'lib/assets/WhiteKingTopLeft.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.KingTopRight){
      return isBlack ? Image.asset(
        'lib/assets/BlackKingTopRight.png',
        width: 256,
        height: 256,
      ):
      Image.asset(
        'lib/assets/WhiteKingTopRight.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.KingButtomLeft){
      return isBlack ? Image.asset(
        'lib/assets/BlackKingButtomLeft.png',
        width: 256,
        height: 256,
      ):
      Image.asset(
        'lib/assets/WhiteKingButtomLeft.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.KingButtomRight){
      return isBlack ? Image.asset(
        'lib/assets/BlackKingButtomRight.png',
        width: 256,
        height: 256,
      ):
      Image.asset(
        'lib/assets/WhiteKingButtomRight.png',
        width: 256,
        height: 256,
      );
    }else if(chessPieces == ChessPieces.Space || chessPieces == ChessPieces.Block){
      return Container();
    }else if(chessPieces == ChessPieces.End){
      return Icon(Icons.flag,size: 50,color: Colors.black,);
    }else if(chessPieces == ChessPieces.EnemyKing){
      return isBlack ? Image.asset(
        'lib/assets/WhiteKing.png',
        width: 256,
        height: 256,
      ):
      Image.asset(
        'lib/assets/BlackKing.png',
        width: 256,
        height: 256,
      );
    }

    return CircularProgressIndicator();
  }
}

enum NextDirection{Left,Right,Top,Bottom}
