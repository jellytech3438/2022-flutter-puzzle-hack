import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_puzzle/src/game/game_bloc.dart';

class OptionPage extends StatefulWidget {
  @override
  _OptionPageState createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {

  @override
  Widget build(BuildContext context) {

    GameBloc _game = BlocProvider.of<GameBloc>(context);

    return Container(
      child: Column(
        children: [
          TextButton(child: Text('return'),onPressed: () => _game.add(GameInitialized()),)
        ],
      ),
    );
  }
}
