import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        children: [
          Text('You lose'),
          TextButton(child: Text('close'),onPressed: () => BlocProvider.of<PuzzleBloc>(context).add(IsHome()))
        ],
      ),
    );
  }
}
