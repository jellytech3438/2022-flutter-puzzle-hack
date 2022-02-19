import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_puzzle/src/game/game_bloc.dart';
import 'package:slide_puzzle/src/model/models.dart';
import 'package:slide_puzzle/src/puzzle/puzzle_bloc.dart';
import 'package:slide_puzzle/src/ui/homepage.dart';

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
        List.filled(11, 0),
        true
        /// star count from 1 to 10
    );
    _puzzleBloc = PuzzleBloc(
        1,TileMovementStatus.nothingTapped
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
      child: ThemeProvider(
        initTheme: ThemeData(
            brightness: Brightness.light,
            primaryColorLight: Colors.white,
            primaryColorDark: Colors.black
        ),
        builder: (_,theme){
          return MaterialApp(
            theme: theme,
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                primaryColorLight: Colors.black,
                primaryColorDark: Colors.white
            ),
            themeMode: ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            home: ThemeSwitchingArea(child: HomePage()),
          );
        },
        // child: MaterialApp(
        //   debugShowCheckedModeBanner: false,
        //   home: HomePage(),
        // ),
      ),
    );
  }
}
