import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_puzzle/src/game/game_bloc.dart';
import 'package:slide_puzzle/src/puzzle/puzzle_bloc.dart';

class OptionPage extends StatefulWidget {
  @override
  _OptionPageState createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {

  bool isBlack = true;

  final _controller1 = CircleColorPickerController(
    initialColor: Colors.white,
  );

  final _controller2 = CircleColorPickerController(
    initialColor: Colors.black,
  );

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
              // CircleColorPicker(
              //   controller: _controller1,
              //   onChanged: (color) {
              //
              //   },
              //   size: const Size(150, 150),
              //   strokeWidth: 4,
              //   thumbSize: 36,
              // ),
              // CircleColorPicker(
              //   controller: _controller2,
              //   onChanged: (color) {
              //
              //   },
              //   size: const Size(150, 150),
              //   strokeWidth: 4,
              //   thumbSize: 36,
              // ),
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
