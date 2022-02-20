import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_puzzle/src/game/game_bloc.dart';
import 'package:slide_puzzle/src/puzzle/puzzle_bloc.dart';

class PuzzleWinPage extends StatefulWidget {
  @override
  _PuzzleWinPageState createState() => _PuzzleWinPageState();
}

class _PuzzleWinPageState extends State<PuzzleWinPage> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> rotateAnimation;
  late Animation<double> resizeAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    rotateAnimation = Tween(begin: 0.0, end: 1.0).animate(controller)
    ..addListener(() {
        setState(() {});
      });
    resizeAnimation = Tween(begin: 300.0, end: 3.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                    fontSize: 45
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
                RotationTransition(
                  turns: rotateAnimation,
                  child: ScaleTransition(
                    scale: resizeAnimation,
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                    ),
                  )
                ),
              for(int j = 0;j < 3 - _gameBloc.levelStars[_puzzleBloc.level];j++)
                Container(
                  width: 50,
                  child: Icon(
                    Icons.star_border,
                    size: 50,
                  ),
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
