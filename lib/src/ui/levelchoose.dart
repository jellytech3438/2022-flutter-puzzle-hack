import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              for(int i = 1;i <= 5;i++)  SizedBox(
                width: 64,
                height: 64,
                child: _game.puzzleStatus[i-1] == PuzzleStatus.complete ? TextButton(child: Text("$i"),onPressed: () => _game.add(StartLevel(i,_puzzle))) : Center(child: Icon(Icons.lock)),
                // child: Column(
                //   children: [
                //     _game.puzzleStatus[i-1] == PuzzleStatus.complete ? TextButton(child: Text("$i"),onPressed: () => _game.add(StartLevel(i,_puzzle))) : Center(child: Icon(Icons.lock)),
                //     // for(int i = 0;i<3;i++) Icon(Icons.star),
                //   ],
                // )
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i = 6;i <= 10;i++)  SizedBox(
                width: 64,
                height: 64,
                child: _game.puzzleStatus[i-1] == PuzzleStatus.complete ? TextButton(child: Text("$i"),onPressed: () => _game.add(StartLevel(i,_puzzle))) : Center(child: Icon(Icons.lock)),
              )
            ],
          ),
          TextButton(child: Text('return'),onPressed: () => _game.add(GameInitialized()),)
        ],
      ),
    );
  }
}
