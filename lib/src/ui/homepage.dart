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
  List<double> elevation = [4.0,4.0,4.0];
  List<double> scale = [1.0,1.0,1.0];
  List<Offset> translate = [Offset(0,0),Offset(0,0),Offset(0,0)];

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
                          /// TODO: make this state to puzzle bloc
                          if (state is ToNextLevelState) {
                            return PuzzleWinPage();
                          }
                          return Column(
                            children: [
                              Container(
                                width: 150,
                                decoration: onHover[0] == false ? BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,  // red as border color
                                  ),
                                ) : null ,
                                padding: EdgeInsets.all(20),
                                child: Center(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(30),
                                    child:Transform.translate(
                                      offset: translate[0] ,
                                      child: Transform.scale(
                                        alignment: Alignment.center,
                                        scale: scale[0],
                                        child: Material(
                                          // elevation: elevation,
                                          child:Text(
                                            'start game',
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(fontSize: 20),
                                            ),
                                          )
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _gameBloc.add(ChooseLevel());
                                      });
                                    },
                                    onHover: (value){
                                      onHover[0] = value;
                                      if(value){
                                        setState((){
                                          elevation[0] = 20.0;
                                          scale[0] = 1.5;
                                          translate[0] = Offset(0,0);
                                        });
                                      }else{
                                        setState((){
                                          elevation[0] = 4.0;
                                          scale[0] = 1.0;
                                          translate[0] = Offset(0,0);
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                              ),
                              Container(
                                width: 150,
                                decoration: onHover[1] == false ? BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,  // red as border color
                                  ),
                                ) : null ,
                                padding: EdgeInsets.all(20),
                                child: Center(
                                  child: InkWell(
                                    child:Transform.translate(
                                      offset: translate[1] ,
                                      child: Transform.scale(
                                        alignment: Alignment.center,
                                        scale: scale[1],
                                        child: Material(
                                          // elevation: elevation,
                                            child:Text(
                                              'option',
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(fontSize: 20),
                                              ),
                                            )
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _gameBloc.add(Option());
                                      });
                                    },
                                    onHover: (value){
                                      onHover[1] = value;
                                      if(value){
                                        setState((){
                                          elevation[1] = 20.0;
                                          scale[1] = 1.5;
                                          translate[1] = Offset(0,0);
                                        });
                                      }else{
                                        setState((){
                                          elevation[1] = 4.0;
                                          scale[1] = 1.0;
                                          translate[1] = Offset(0,0);
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                              ),
                              Container(
                                width: 150,
                                decoration: onHover[2] == false ? BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,  // red as border color
                                  ),
                                ) : null ,
                                padding: EdgeInsets.all(20),
                                child: Center(
                                  child: InkWell(
                                    child:Transform.translate(
                                      offset: translate[2] ,
                                      child: Transform.scale(
                                        alignment: Alignment.center,
                                        scale: scale[2],
                                        child: Material(
                                          // elevation: elevation,
                                            child:Text(
                                              'exit',
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(fontSize: 20),
                                              ),
                                            )
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      SystemNavigator.pop();
                                    },
                                    onHover: (value){
                                      onHover[2] = value;
                                      if(value){
                                        setState((){
                                          elevation[2] = 20.0;
                                          scale[2] = 1.5;
                                          translate[2] = Offset(0,0);
                                        });
                                      }else{
                                        setState((){
                                          elevation[2] = 4.0;
                                          scale[2] = 1.0;
                                          translate[2] = Offset(0,0);
                                        });
                                      }
                                    },
                                  ),
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
            return PuzzleWinPage();
          }
          return LevelPage();
        },
      ),
    );
  }
}

