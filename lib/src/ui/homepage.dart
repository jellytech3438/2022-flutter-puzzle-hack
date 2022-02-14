import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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

  List<bool> onHover = [false,false,false];

  @override
  void initState() {
    super.initState();
    ///what is different between context.read and BlocProvider.of ???
    _gameBloc = BlocProvider.of<GameBloc>(context);
    _puzzleBloc = BlocProvider.of<PuzzleBloc>(context);
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: BlocBuilder<PuzzleBloc, PuzzleState>(
        builder: (context, state) {
          if(state is IsHomeState){
            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Chesslide puzzle game',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(fontSize: 30),
                        ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(20),
                    ),
                    BlocBuilder<GameBloc, GameState>(
                        builder: (BuildContext context, GameState state) {
                          if (state is ChooseLevelState) {
                            return ChooseLevelPage();
                          }
                          if (state is OptionPageState) {
                            return OptionPage();
                          }
                          // if (state is ToNextLevelState) {
                          //   return PuzzleWinPage();
                          // }
                          return Column(
                            children: [
                              Center(
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child:GestureDetector(
                                    child: AnimatedContainer(
                                      width: 180,
                                      decoration:BoxDecoration(
                                        border: onHover[0] ? Border() : Border.all(color: Colors.black,),
                                      ),
                                      padding: EdgeInsets.all(20),
                                      duration: Duration(milliseconds: 300),
                                      transform: Matrix4.identity(),
                                      child: AnimatedDefaultTextStyle(
                                        style: onHover[0] ? TextStyle(fontSize: 28) : TextStyle(fontSize: 20),
                                        duration: Duration(milliseconds: 300),
                                        child: Center(
                                          child: Text(
                                            'start game',
                                            style: GoogleFonts.lato(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _gameBloc.add(ChooseLevel());
                                      });
                                    },
                                  ),
                                  onEnter: (value){
                                    setState((){
                                      onHover[0] = true;
                                    });
                                  },
                                  onExit: (value){
                                    setState((){
                                      onHover[0] = false;
                                    });
                                  }
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                              ),
                              Center(
                                child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child:GestureDetector(
                                      child: AnimatedContainer(
                                        width: 180,
                                        decoration:BoxDecoration(
                                          border: onHover[1] ? Border() : Border.all(color: Colors.black,),
                                        ),
                                        padding: EdgeInsets.all(20),
                                        duration: Duration(milliseconds: 300),
                                        transform: Matrix4.identity(),
                                        child: AnimatedDefaultTextStyle(
                                          style: onHover[1] ? TextStyle(fontSize: 28) : TextStyle(fontSize: 20),
                                          duration: Duration(milliseconds: 300),
                                          child: Center(
                                            child: Text(
                                              'option',
                                              style: GoogleFonts.lato(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _gameBloc.add(Option());
                                        });
                                      },
                                    ),
                                    onEnter: (value){
                                      setState((){
                                        onHover[1] = true;
                                      });
                                    },
                                    onExit: (value){
                                      setState((){
                                        onHover[1] = false;
                                      });
                                    }
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                              ),
                              Center(
                                child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child:GestureDetector(
                                      child: AnimatedContainer(
                                        width: 180,
                                        decoration:BoxDecoration(
                                          border: onHover[2] ? Border() : Border.all(color: Colors.black,),
                                        ),
                                        padding: EdgeInsets.all(20),
                                        duration: Duration(milliseconds: 300),
                                        transform: Matrix4.identity(),
                                        child: AnimatedDefaultTextStyle(
                                          style: onHover[2] ? TextStyle(fontSize: 28) : TextStyle(fontSize: 20),
                                          duration: Duration(milliseconds: 300),
                                          child: Center(
                                            child: Text(
                                              'exit',
                                              style: GoogleFonts.lato(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          SystemNavigator.pop();
                                        });
                                      },
                                    ),
                                    onEnter: (value){
                                      setState((){
                                        onHover[2] = true;
                                      });
                                    },
                                    onExit: (value){
                                      setState((){
                                        onHover[2] = false;
                                      });
                                    }
                                ),
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
          }else if(state is PuzzleWinState){
            print("get star : " + state.getstar.toString());
            if(_gameBloc.levelStars[state.completelevel] <= state.getstar){
              _gameBloc.levelStars[state.completelevel] = state.getstar;
            }
            return PuzzleWinPage(state.getstar);
          }
          return LevelPage();
        },
      ),
    );
  }
}

