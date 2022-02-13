import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_puzzle/src/game/game_bloc.dart';

class PuzzleWinPage extends StatefulWidget {
  @override
  _PuzzleWinPageState createState() => _PuzzleWinPageState();
}

class _PuzzleWinPageState extends State<PuzzleWinPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextButton(child: Text('to next level'), onPressed:() {
            setState(() {
              BlocProvider.of<GameBloc>(context).level += 1;
              BlocProvider.of<GameBloc>(context).add(GameInitialized());
            });
          }),
        ],
      ),
    );
  }
}
