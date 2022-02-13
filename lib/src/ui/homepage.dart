import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_puzzle/src/game/game_bloc.dart';
import 'package:slide_puzzle/src/puzzle/puzzle_bloc.dart';
import 'package:slide_puzzle/src/ui/levelchoose.dart';

import 'winpage.dart';
import 'levelspage.dart';
import 'losepage.dart';
import 'optionpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late GameBloc _gameBloc;
  late PuzzleBloc _puzzleBloc;

  @override
  void initState() {
    super.initState();
    _gameBloc = BlocProvider.of<GameBloc>(context);
    _puzzleBloc = BlocProvider.of<PuzzleBloc>(context);
  }

  @override
  Widget build(BuildContext context) {

    ///what is different between context.read and BlocProvider.of ???

    return Material(
      child: BlocBuilder<PuzzleBloc, PuzzleState>(
        builder: (context, state) {
          if(state is IsHomeState){
            return Center(
                child: Column(
                  children: [
                    Text(
                        'Welcome to flutter puzzle hack 2022'
                    ),
                    BlocBuilder<GameBloc, GameState>(
                        builder: (BuildContext context, GameState state) {
                          if (state is ChooseLevelState) {
                            return ChooseLevelPage();
                          }
                          if (state is OptionPageState) {
                            return OptionPage();
                          }
                          if (state is ToNextLevelState) {
                            return PuzzleWinPage();
                          }
                          return Column(
                            children: [
                              TextButton(child: Text('start game'),
                                  onPressed: () {
                                    setState(() {
                                      _gameBloc.add(ChooseLevel());
                                    });
                                  }),
                              TextButton(child: Text('option'), onPressed: () {
                                setState(() {
                                  _gameBloc.add(Option());
                                });
                              }),
                              TextButton(child: Text('exit'), onPressed: () =>
                                  SystemNavigator.pop()
                              ),
                            ],
                          );
                        }
                    ),
                  ],
                )
            );
          }else if(state is PuzzleLoseState){
            return PuzzleLosePage();
          }
          return LevelPage();
        },
      ),
    );
  }
}

