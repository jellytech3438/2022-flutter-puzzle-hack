import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_puzzle/src/game/game_bloc.dart';
import 'package:slide_puzzle/src/model/models.dart';
import 'package:slide_puzzle/src/puzzle/puzzle_bloc.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TutorialPage extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {

  final List<TargetFocus> targets = [];

  late TargetPosition KingPosition;
  bool foundFlag = false;

  GlobalKey key0 = GlobalKey();
  GlobalKey key1 = GlobalKey();
  GlobalKey key2 = GlobalKey();
  GlobalKey key3 = GlobalKey();
  GlobalKey key4 = GlobalKey();

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
  void initState(){
    super.initState();
    targets.add(
        TargetFocus(
            identify: "Welcome",
            enableOverlayTab: true,
            targetPosition: TargetPosition(Size((window.physicalSize / window.devicePixelRatio).width/3*2,(window.physicalSize / window.devicePixelRatio).width/3*2),Offset((window.physicalSize / window.devicePixelRatio).width/5 ,(window.physicalSize / window.devicePixelRatio).height/3)),
            // targetPosition: TargetPosition(Size((window.physicalSize / window.devicePixelRatio).width ,(window.physicalSize / window.devicePixelRatio).height),Offset((window.physicalSize / window.devicePixelRatio).width/3 ,(window.physicalSize / window.devicePixelRatio).height/3)),
            contents: [
              TargetContent(
                  align: ContentAlign.top,
                  child: Column(
                    children: [
                      Center(
                        child:Text(
                          "Welcome to Tutorial",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 30,
                                color: Colors.white
                              )
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 78),),
                    ],
                  )
              ),
              // TargetContent(
              //     customPosition: CustomTargetContentPosition(
              //       top : 50,
              //       left : 50,
              //       right : 50,
              //       bottom : 50,
              //       // top :(window.physicalSize / window.devicePixelRatio).width/3,
              //       // left :(window.physicalSize / window.devicePixelRatio).height/3,
              //       // right :(window.physicalSize / window.devicePixelRatio).width/3*2,
              //       // bottom :(window.physicalSize / window.devicePixelRatio).height/3*2,
              //     ),
              //     align: ContentAlign.custom,
              //     child: Center(
              //       child:Text(
              //         "This is a test",
              //         style: GoogleFonts.lato(
              //             textStyle: TextStyle(
              //                 fontSize: 30,
              //                 color: Colors.black
              //             )
              //         ),
              //       ),
              //     )
              // ),
            ]
        )
    );
    targets.add(
        TargetFocus(
            identify: "Target 0",
            enableOverlayTab: true,
            keyTarget: key0,
            paddingFocus: 10.0,
            contents: [
              TargetContent(
                /// this align is show the text top or bottom or ... the circle
                  align: ContentAlign.bottom,
                  child: Container(
                    child:Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 100),),
                        Text(
                          "On the top are level and left step",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "if the left step is lower than 0 then you will fail this level",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white
                                )
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
              )
            ]
        )
    );
    targets.add(
        TargetFocus(
            identify: "Target 1",
            enableOverlayTab: true,
            keyTarget: key1,
            paddingFocus: 10.0,
            contents: [
              TargetContent(
                  align: ContentAlign.bottom,
                  child: Container(
                    child:Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 100),),
                        Text(
                          "You can see where the chess can move by tap it",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "in each level there are some missions to complete",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white
                                )
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
              )
            ]
        )
    );
    targets.add(
        TargetFocus(
            identify: "Target 2",
            enableOverlayTab: true,
            keyTarget: key2,
            paddingFocus: 10.0,
            contents: [
              TargetContent(
                  align: ContentAlign.bottom,
                  child: Container(
                    child:Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 50),),
                        Text(
                          "Sometimes the enemy king is on the map",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "You can pass this level without capture it, but you may not get full stars",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Notice: King cannot eat enemy king",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white
                                )
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
              )
            ]
        )
    );
    targets.add(
        TargetFocus(
            identify: "Target 3",
            enableOverlayTab: true,
            keyTarget: key3,
            paddingFocus: 10.0,
            contents: [
              TargetContent(
                  align: ContentAlign.top,
                  child: Container(
                    child:Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Find a way to the End",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "your goal is to make King move to the finish flag in the given step",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white
                                )
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 50),),
                      ],
                    ),
                  )
              )
            ]
        )
    );
    targets.add(
        TargetFocus(
            identify: "Target 4",
            enableOverlayTab: true,
            keyTarget: key4,
            paddingFocus: 10.0,
            contents: [
              TargetContent(
                  align: ContentAlign.top,
                  child: Container(
                    child:Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Last, reset the whole map",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "this can reset the map to default state and cost nothing",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white
                                )
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 50),),
                      ],
                    ),
                  )
              )
            ]
        )
    );
    targets.add(
        TargetFocus(
            identify: "Finish",
            enableOverlayTab: true,
            targetPosition: TargetPosition(Size((window.physicalSize / window.devicePixelRatio).width/3*2,(window.physicalSize / window.devicePixelRatio).width/3*2),Offset((window.physicalSize / window.devicePixelRatio).width/5 ,(window.physicalSize / window.devicePixelRatio).height/3)),
            // targetPosition: TargetPosition(Size((window.physicalSize / window.devicePixelRatio).width ,(window.physicalSize / window.devicePixelRatio).height),Offset((window.physicalSize / window.devicePixelRatio).width/3 ,(window.physicalSize / window.devicePixelRatio).height/3)),
            contents: [
              TargetContent(
                  align: ContentAlign.top,
                  child: Column(
                    children: [
                      Center(
                        child:Text(
                          "Congratulation!",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white
                              )
                          ),
                        ),
                      ),
                      // Padding(padding: EdgeInsets.only(bottom: 78),),
                    ],
                  )
              ),
              TargetContent(
                align: ContentAlign.bottom,
                child: Center(
                  child:Text(
                    "now you can try yourself to pass this level",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                        )
                    ),
                  ),
                ),
              )
            ]
        )
    );
    WidgetsBinding.instance!.addPostFrameCallback(_layout);

  }

  void _layout(_){
    Future.delayed(Duration(milliseconds: 100));
    showTutorial();
  }

  void showTutorial() {
    TutorialCoachMark(
      context,
      targets: targets, // List<TargetFocus>
      // alignSkip: Alignment.bottomRight,
      // textSkip: "SKIP",
      // paddingFocus: 10,
      // opacityShadow: 0.8,
      onClickTarget: (target){
        print(target);
      },
      onClickOverlay: (target){
        print(target);
      },
      onSkip: (){
        print("skip");
      },
      onFinish: (){
        print("finish");
      },
    )..show();
  }

  // void foundKingPosition(){
  //   for(List<Tile> l in _puzzleBloc.state.puzzle.tiles){
  //     for(Tile t in l){
  //       if(t.value == ChessPieces.KingTopLeft) {
  //         double x = l.indexOf(t).toDouble();
  //         double y = _puzzleBloc.state.puzzle.tiles.indexOf(l).toDouble();
  //         KingPosition = TargetPosition(Size(55 * 2, 55 * 2),Offset(x,y));
  //         print("Offset x : " + x.toString());
  //         print("Offset y : " + y.toString());
  //         break;
  //       }
  //     }
  //   }
  // }

  GlobalKey? giveKeyAccordingValue(ChessPieces chessPieces){
    if(chessPieces == ChessPieces.Pawn){
      return key1;
    }else if(chessPieces == ChessPieces.EnemyKing){
      return key2;
    }else if(chessPieces == ChessPieces.End && foundFlag == false){
      foundFlag = true;
      return key3;
    }
   return null;
  }

  @override
  Widget build(BuildContext context) {

    GameBloc _gameBloc = BlocProvider.of<GameBloc>(context);
    PuzzleBloc _puzzleBloc = BlocProvider.of<PuzzleBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Tutorial Level',
          style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 30),
          ),
          key: key0,
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
                      width: 55.0,
                      height: 55.0,
                      key: giveKeyAccordingValue(t.value),
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
              onPressed: () => _puzzleBloc.add(Tutorial()),
              key: key4,
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
