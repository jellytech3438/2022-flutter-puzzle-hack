import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_puzzle/src/game/game_bloc.dart';
import 'package:slide_puzzle/src/model/models.dart';
import 'package:slide_puzzle/src/puzzle/puzzle_bloc.dart';
import 'package:slide_puzzle/src/ui/levelchoose.dart';
import 'package:slide_puzzle/src/ui/tutorialpage.dart';

import 'winpage.dart';
import 'levelspage.dart';
import 'losepage.dart';
import 'optionpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late GameBloc _gameBloc;
  late PuzzleBloc _puzzleBloc;
  late AnimationController _animationController;
  late RenderBox box;

  GlobalKey _logoKey = GlobalKey();

  List<bool> onHover = [false,false,false,false];

  @override
  void initState() {
    super.initState();
    ///what is different between context.read and BlocProvider.of ???
    _gameBloc = BlocProvider.of<GameBloc>(context);
    _puzzleBloc = BlocProvider.of<PuzzleBloc>(context);

    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildAccordingPuzzleState(context, state){
    if(state is IsHomeState){
      return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chessl',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(fontSize: 45),
                        ),
                      ),
                      Image.asset(
                        "lib/assets/LogoI.png",
                        width: 25,
                        height: 45,
                        key: _logoKey,
                      ),
                      Text(
                        'de puzzle',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(fontSize: 45),
                        ),
                      ),
                    ],
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
                      return Column(
                        children: [
                          Center(
                            child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child:GestureDetector(
                                  child: AnimatedContainer(
                                    width: 180,
                                    decoration:BoxDecoration(
                                      border: onHover[3] ? Border() : Border.all(color: Colors.black,),
                                    ),
                                    padding: EdgeInsets.only(top: 20,bottom: 20),
                                    duration: Duration(milliseconds: 300),
                                    transform: Matrix4.identity(),
                                    child: AnimatedDefaultTextStyle(
                                      style: onHover[3] ? TextStyle(fontSize: 28) : TextStyle(fontSize: 20),
                                      duration: Duration(milliseconds: 300),
                                      child: Center(
                                        child: Text(
                                          'How to play?',
                                          style: GoogleFonts.lato(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _puzzleBloc.add(Tutorial());
                                    });
                                  },
                                ),
                                onEnter: (value){
                                  setState((){
                                    onHover[3] = true;
                                  });
                                },
                                onExit: (value){
                                  setState((){
                                    onHover[3] = false;
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: AnimatedBuilder(
          animation: _animationController,
          builder: (context,child){
            box = _logoKey.currentContext?.findRenderObject() as RenderBox;
            return child!;
          },
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            child: Icon(Icons.cached),
            onPressed: () {

              print('change theme');
            },
          ),
        ),
      );
    }else if(state is TutorialState){
      return TutorialPage();
    }else if(state is PuzzleLoseState){
      return PuzzleLosePage();
    }else if(state is PuzzleWinState){
      if(_gameBloc.levelStars[state.completelevel] <= state.getstar){
        /// this complete level is the number of the level
        /// so if it turn to index of the list, it'll make next level unlock
        _gameBloc.levelStars[state.completelevel] = state.getstar;
        if(state.completelevel < 10){
          /// there are only 10 level
          _gameBloc.puzzleStatus[state.completelevel] = PuzzleStatus.complete;
        }
      }
      return PuzzleWinPage();
    }else if(state is IsGameState){
      return LevelPage();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: BlocBuilder<PuzzleBloc, PuzzleState>(
          builder: (context, state) {
            return AnimatedSwitcher(
              transitionBuilder: (Widget child, Animation<double> animation){
                // return FadeTransition(child: child,opacity: animation,);
                return ScaleTransition(child: child,scale: animation,);
                // return SizeTransition(
                //   sizeFactor: animation,
                //   axis: Axis.horizontal,
                //   axisAlignment: -1,
                //   child: child,
                // );
              },
              duration: Duration(milliseconds: 250),
              child: _buildAccordingPuzzleState(context, state),
            );
          },
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  MyClipper({required this.sizeRate, required this.offset});
  final double sizeRate;
  final Offset offset;

  @override
  Path getClip(Size size) {
    var path = Path()
      ..addOval(
        Rect.fromCircle(center: offset, radius: size.height * sizeRate),
      );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}