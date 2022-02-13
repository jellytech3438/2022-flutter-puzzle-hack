import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_puzzle/src/game/game_bloc.dart';
import 'package:slide_puzzle/src/model/models.dart';
import 'package:slide_puzzle/src/puzzle/puzzle_bloc.dart';

class LevelPage extends StatefulWidget {
  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {

  /// there's a useful function of BlocProvider is BlocProvider.of<GameBloc>(context)
  /// so we don't pass the bloc as parameter

  BoxBorder returnBorder(Tile t){
    if(t.value == ChessPieces.KingTopLeft){
      return Border(
        top: BorderSide(color: Colors.black, width: 2),
        left: BorderSide(color: Colors.black, width: 2)
      );
    }else if(t.value == ChessPieces.KingTopRight){
      return Border(
          top: BorderSide(color: Colors.black, width: 2),
          right: BorderSide(color: Colors.black, width: 2)
      );
    }else if(t.value == ChessPieces.KingButtomLeft){
      return Border(
          bottom: BorderSide(color: Colors.black, width: 2),
          left: BorderSide(color: Colors.black, width: 2)
      );
    }else if(t.value == ChessPieces.KingButtomRight){
      return Border(
          bottom: BorderSide(color: Colors.black, width: 2),
          right: BorderSide(color: Colors.black, width: 2)
      );
    }
    return Border.all(
        color: Colors.black,
        width: 2
    );
  }

  @override
  Widget build(BuildContext context) {

    /// this is state since the last is bloc.state
    /// if bloc.state.puzzle then this is Puzzle

    GameBloc _gameBloc = BlocProvider.of<GameBloc>(context);
    PuzzleBloc _puzzleBloc = BlocProvider.of<PuzzleBloc>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(child: Text('return'),onPressed: () => _puzzleBloc.add(IsHome()),),
            TextButton(child: Text('reset puzzle'),onPressed: () => _puzzleBloc.add(PuzzleReset()),),
            TextButton(child: Text('option'),onPressed: () => _gameBloc.add(GameInitialized()),),
          ],
        ),
        Text('Left steps : ${_puzzleBloc.leftmovesteps}'),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _puzzleBloc.state.puzzle.tiles.map((list) {
            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(Tile t in list) SizedBox(
                      width: 64.0,
                      height: 64.0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _puzzleBloc.add(PressedTile(t));
                          });
                        },
                        // onLongPress: ,
                        child: Container(
                            decoration: BoxDecoration(
                                border: returnBorder(t),
                                color: t.tapped ? Colors.green : t
                                    .currentPosition.isEven() ? Colors
                                    .white : Colors.black45
                            ),
                            child: ChessImage(t.value)
                        ),
                      )
                  ),
                ],
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
