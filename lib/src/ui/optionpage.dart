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

  ThemeData classic = ThemeData(
      primaryColorLight: Color.fromRGBO(255,255,255, 1.0),
      primaryColorDark:  Color.fromRGBO(105,105,105, 1.0),
      selectedRowColor: Colors.green
  );

  ThemeData newstyle = ThemeData(
      primaryColorLight: Color.fromRGBO(238,238,213,1.0),
      primaryColorDark:  Color.fromRGBO(125,148,93,1.0),
      selectedRowColor: Color.fromRGBO(186, 202, 66, 1.0)
  );

  ThemeData plank = ThemeData(
      primaryColorLight: Color.fromRGBO(239,217,183,1.0),
      primaryColorDark:  Color.fromRGBO(180,136,102,1.0),
      selectedRowColor: Color.fromRGBO(239, 204, 112, 1.0)
  );

  @override
  Widget build(BuildContext context) {

    GameBloc _game = BlocProvider.of<GameBloc>(context);
    PuzzleBloc _puzzle = BlocProvider.of<PuzzleBloc>(context);

    List<bool> selectTheme = _puzzle.boardtheme;
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
    
    Widget _arrangeColor(ThemeData theme){
      return Row(
        children: [
          Container(
            width: 80,
            height: 80,
            color: theme.primaryColorLight,
          ),
          Container(
            width: 80,
            height: 80,
            color: theme.primaryColorDark,
          ),
          Container(
            width: 80,
            height: 80,
            color: theme.selectedRowColor,
          ),
        ],
      );
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
                value: selectTheme[0],
                onChanged: (bool? value) {
                  setState(() {
                    if(value! == true){
                      for(int i = 0;i<selectTheme.length;i++){
                        if(selectTheme[i] == true && i != 0){
                          _puzzle.boardtheme[i] = false;
                        }
                      }
                      _puzzle.boardtheme[0] = value;
                      _puzzle.theme = classic;
                    }
                    if(value == false){
                      if(selectTheme[1] == false && selectTheme[2] == false){
                        _puzzle.boardtheme[0] = true;
                      }
                    }
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              _arrangeColor(classic)
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
                      for(int i = 0;i<selectTheme.length;i++){
                        if(selectTheme[i] == true && i != 1){
                          _puzzle.boardtheme[i] = false;
                        }
                      }
                      _puzzle.boardtheme[1] = value;
                      _puzzle.theme = newstyle;
                    }
                    if(value == false){
                      if(selectTheme[0] == false && selectTheme[2] == false){
                        _puzzle.boardtheme[1] = true;
                      }
                    }
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              _arrangeColor(newstyle)
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
                      for(int i = 0;i<selectTheme.length;i++){
                        if(selectTheme[i] == true && i != 2){
                          _puzzle.boardtheme[i] = false;
                        }
                      }
                      _puzzle.boardtheme[2] = value;
                      _puzzle.theme = plank;
                    }
                    if(value == false){
                      if(selectTheme[0] == false && selectTheme[1] == false){
                        _puzzle.boardtheme[2] = true;
                      }
                    }
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              _arrangeColor(plank)
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
