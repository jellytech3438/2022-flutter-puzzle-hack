import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
    }else if(t.value == ChessPieces.Block){
      return Border();
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Level ${_puzzleBloc.level}',
          style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 30),
          ),
        ),
        Padding(padding: EdgeInsets.all(20),),
        Text(
          'Left steps : ${_puzzleBloc.leftmovesteps}',
          style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20),
          ),
        ),
        Padding(padding: EdgeInsets.all(20),),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _puzzleBloc.state.puzzle.tiles.map((list) {
            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(Tile t in list) SizedBox(
                      width: 75.0,
                      height: 75.0,
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
                                color: t.value == ChessPieces.Block ? Colors.transparent : t.tapped ? Colors.green : t
                                    .currentPosition.isEven() ? Colors
                                    .white : Colors.black45
                            ),
                            child: ChessImage(t.value,_puzzleBloc.isBlack)
                        ),
                      )
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        Padding(padding: EdgeInsets.all(20),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text(
                'reset puzzle',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
              onPressed: () => _puzzleBloc.add(PuzzleInitialized(_puzzleBloc.level)),
            ),
            Padding(padding: EdgeInsets.all(20),),
            TextButton(
              child: Text(
                'return',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
              onPressed: () => _puzzleBloc.add(IsHome()),
            ),
          ],
        ),
      ],
    );
  }
}
