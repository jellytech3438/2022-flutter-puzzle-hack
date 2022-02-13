import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_puzzle/src/game/game_bloc.dart';
import 'package:slide_puzzle/src/model/models.dart';
import 'package:slide_puzzle/src/puzzle/puzzle_bloc.dart';
import 'package:slide_puzzle/src/ui/homepage.dart';
import 'package:slide_puzzle/src/ui/levelspage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GameBloc _gameBloc;
  late PuzzleBloc _puzzleBloc;

  @override
  void initState() {
    super.initState();
    _gameBloc = GameBloc(
        1,
        List.filled(10, PuzzleStatus.incomplete)
          ..[0] = PuzzleStatus.complete,
        List.filled(10, 0)
    );
    _puzzleBloc = PuzzleBloc(
        1, 10,TileMovementStatus.nothingTapped
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => _gameBloc..add(GameInitialized()),
        ),
        BlocProvider(
          create: (BuildContext context) => _puzzleBloc..add(IsHome()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
