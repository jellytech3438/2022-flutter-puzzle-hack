import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_puzzle/src/game/game_bloc.dart';
import 'package:slide_puzzle/src/model/models.dart';
import 'package:slide_puzzle/src/puzzle/puzzle_bloc.dart';

class PuzzleWinPage extends StatefulWidget {
  PuzzleWinPage(this.getstar);

  final int getstar;

  @override
  _PuzzleWinPageState createState() => _PuzzleWinPageState(getstar);
}

class _PuzzleWinPageState extends State<PuzzleWinPage> {
  _PuzzleWinPageState(this.getstar);

  final int getstar;

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
            'you obtain ${this.getstar} star in this level',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 20
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int j = 0;j < this.getstar;j++) Icon(
                Icons.star,
                color: Colors.amber,
              ),
              for(int j = 0;j < 3 - this.getstar;j++) Icon(
                Icons.star_border,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          TextButton(
              child: Text(
                'to next level',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 20
                    )
                ),
              ),
              onPressed:() {
                setState(() {
                  _puzzleBloc.add(IsHome());
                  _gameBloc.puzzleStatus[_gameBloc.level] = PuzzleStatus.complete;
                  _gameBloc.add(ChooseLevel());
                });
          }),
        ],
      ),
    );
  }
}
