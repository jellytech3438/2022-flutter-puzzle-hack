import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_puzzle/src/game/game_bloc.dart';
import 'package:slide_puzzle/src/model/models.dart';
import 'package:slide_puzzle/src/puzzle/puzzle_bloc.dart';

class ChooseLevelPage extends StatefulWidget {
  @override
  _ChooseLevelPageState createState() => _ChooseLevelPageState();
}

class _ChooseLevelPageState extends State<ChooseLevelPage> {
  @override
  Widget build(BuildContext context) {

    GameBloc _game = BlocProvider.of<GameBloc>(context);
    PuzzleBloc _puzzle = BlocProvider.of<PuzzleBloc>(context);

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i = 1;i <= 5;i++)  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 75,
                  height: 75,
                  child: _game.puzzleStatus[i-1] == PuzzleStatus.complete
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextButton(
                                  child: Text(
                                      "$i",
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(fontSize: 20),
                                      ),
                                  ),
                                  onPressed: () => _game.add(StartLevel(i,_puzzle))
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for(int i = 0;i < _game.levelStars[i];i++) Icon(
                                  Icons.star,
                                ),
                                for(int i = 0;i < 3 - _game.levelStars[i];i++) Icon(
                                  Icons.star_border,
                                )
                              ],
                            )
                          ],
                        )
                      : Center(child: Icon(Icons.lock)),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i = 6;i <= 10;i++)  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 75,
                  height: 75,
                  child: _game.puzzleStatus[i-1] == PuzzleStatus.complete
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextButton(
                                  child: Text(
                                    "$i",
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  onPressed: () => _game.add(StartLevel(i,_puzzle))
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for(int i = 0;i < _game.levelStars[i];i++) Icon(
                                  Icons.star,
                                ),
                                for(int i = 0;i < 3 - _game.levelStars[i];i++) Icon(
                                  Icons.star_border,
                                )
                              ],
                            )
                          ],
                        )
                      : Center(child: Icon(Icons.lock)),
                ),
              )
            ],
          ),
          TextButton(
            child: Text(
              'return',
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            onPressed: () => _game.add(GameInitialized()),
          )
        ],
      ),
    );
  }
}
