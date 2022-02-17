import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:slide_puzzle/src/game/game_bloc.dart';
import 'package:slide_puzzle/src/puzzle/puzzle_bloc.dart';

class PuzzleWinPage extends StatefulWidget {
  @override
  _PuzzleWinPageState createState() => _PuzzleWinPageState();
}

class _PuzzleWinPageState extends State<PuzzleWinPage> {

  @override
  Widget build(BuildContext context) {
    GameBloc _gameBloc = BlocProvider.of<GameBloc>(context);
    PuzzleBloc _puzzleBloc = BlocProvider.of<PuzzleBloc>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Congratulation!',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 30
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Text(
            'you obtain ${_gameBloc.levelStars[_puzzleBloc.level]} star in this level',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 20
                )
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(20),
          // ),
          // Text(
          //   _gameBloc.levelStars[_puzzleBloc.level] == 3 ? 'you clear this level perfectly' : 'Hint : try to complete level in fewer steps or make sure to capture every enemy pieces',
          //   style: GoogleFonts.lato(
          //       textStyle: TextStyle(
          //           fontSize: 15
          //       )
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int j = 0;j < _gameBloc.levelStars[_puzzleBloc.level];j++)
                // Container(
                //   width: 100,
                //   height: 100,
                //   child: RiveAnimation.asset(
                //     'rotateStar.riv',
                //   ),
                // ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              for(int j = 0;j < 3 - _gameBloc.levelStars[_puzzleBloc.level];j++) Icon(
                Icons.star_border,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          TextButton(
              child: Text(
                _puzzleBloc.level < 10 ? 'to next level' : 'return',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 20
                    )
                ),
              ),
              onPressed:() {
                setState(() {
                  _puzzleBloc.add(IsHome());
                  // _gameBloc.add(ChooseLevel());
                });
          }),
        ],
      ),
    );
  }
}
