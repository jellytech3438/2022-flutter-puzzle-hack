import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_puzzle/src/puzzle/puzzle_bloc.dart';

class PuzzleLosePage extends StatefulWidget {
  @override
  _PuzzleLosePageState createState() => _PuzzleLosePageState();
}

class _PuzzleLosePageState extends State<PuzzleLosePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You lose',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 30
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Text(
            'please try again',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 20
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          TextButton(
              child: Text(
                'close',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 20
                    )
                ),
              ),
              onPressed: () => BlocProvider.of<PuzzleBloc>(context).add(IsHome())
          )
        ],
      ),
    );
  }
}
