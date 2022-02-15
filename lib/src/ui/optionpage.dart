import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_puzzle/src/game/game_bloc.dart';
import 'package:slide_puzzle/src/puzzle/puzzle_bloc.dart';

class OptionPage extends StatefulWidget {
  @override
  _OptionPageState createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {

  bool isBlack = true;
  List<bool> boardtheme = [true,false,false];

  @override
  Widget build(BuildContext context) {

    GameBloc _game = BlocProvider.of<GameBloc>(context);
    PuzzleBloc _puzzle = BlocProvider.of<PuzzleBloc>(context);
    isBlack = _puzzle.isBlack;

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Player chess color',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 25
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isBlack,
                onChanged: (bool? value) {
                  setState(() {
                    isBlack = value!;
                    _puzzle.isBlack = isBlack;
                  });
                },
              ),
              Image.asset(
                'lib/assets/BlackKing.png',
                width: 100,
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: !isBlack,
                onChanged: (bool? value) {
                  setState(() {
                    isBlack = !value!;
                    _puzzle.isBlack = isBlack;
                  });
                },
              ),
              Image.asset(
                'lib/assets/WhiteKing.png',
                width: 100,
                height: 100,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Text(
            'Chessboard color',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 25
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: _puzzle.boardtheme[0],
                onChanged: (bool? value) {
                  setState(() {
                    if(value! == true){
                      if(boardtheme[1] == true){
                        boardtheme[1] = false;
                        boardtheme[0] = value;
                      }
                      if(boardtheme[2] == true){
                        boardtheme[2] = false;
                        boardtheme[0] = value;
                      }
                    }
                    if(value == false){
                      if(boardtheme[1] == false && boardtheme[2] == false){
                        boardtheme[0] = true;
                      }
                    }
                    _puzzle.boardtheme = boardtheme;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.white,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.black45,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: _puzzle.boardtheme[1],
                onChanged: (bool? value) {
                  setState(() {
                    if(value! == true){
                      if(boardtheme[0] == true){
                        boardtheme[0] = false;
                        boardtheme[1] = value;
                      }
                      if(boardtheme[2] == true){
                        boardtheme[2] = false;
                        boardtheme[1] = value;
                      }
                    }
                    if(value == false){
                      if(boardtheme[0] == false && boardtheme[2] == false){
                        boardtheme[1] = true;
                      }
                    }
                    _puzzle.boardtheme = boardtheme;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                width: 80,
                height: 80,
                color: Color.fromRGBO(238,238,213,1.0),
              ),
              Container(
                width: 80,
                height: 80,
                color: Color.fromRGBO(125,148,93,1.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: _puzzle.boardtheme[2],
                onChanged: (bool? value) {
                  setState(() {
                    if(value! == true){
                      if(boardtheme[0] == true){
                        boardtheme[0] = false;
                        boardtheme[2] = value;
                      }
                      if(boardtheme[1] == true){
                        boardtheme[1] = false;
                        boardtheme[2] = value;
                      }
                    }
                    if(value == false){
                      if(boardtheme[0] == false && boardtheme[1] == false){
                        boardtheme[2] = true;
                      }
                    }
                    _puzzle.boardtheme = boardtheme;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                width: 80,
                height: 80,
                color: Color.fromRGBO(239,217,183,1.0),
              ),
              Container(
                width: 80,
                height: 80,
                color: Color.fromRGBO(180,136,102,1.0),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          TextButton(child: Text(
              'return',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 20
                  )
              ),
            ),
            onPressed: () => _game.add(GameInitialized()),
          ),
        ],
      ),
    );
  }
}
