import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:slide_puzzle/src/model/models.dart';
import 'package:slide_puzzle/src/puzzle/puzzle_bloc.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc(this.level,this.puzzleStatus,this.levelStars,this.themeisWhite) : super(const GameState()) {
    // event is input
    // state is output
    // on<input>(function that emit new state or just do something)
    on<ChooseLevel>(_onChooseLevel);
    on<Option>(_onOption);
    on<StartLevel>(_onStartLevel);
    on<GameInitialized>(_onGameInitialized);
  }

  // Parameters

  int level;

  List<PuzzleStatus> puzzleStatus;

  List<int> levelStars;

  bool themeisWhite;

  // Event Handler

  void _onGameInitialized(GameInitialized event, Emitter<GameState> emit,) {
    emit(
      GameState(),
    );
  }

  void _onChooseLevel(ChooseLevel event, Emitter<GameState> emit,) {
    emit(ChooseLevelState());
  }

  void _onOption(Option event, Emitter<GameState> emit){
    emit(OptionPageState());
  }

  void _onStartLevel(StartLevel event, Emitter<GameState> emit,) {
    this.level = event.chooseLevel;
    event.puzzleBloc.add(PuzzleInitialized(this.level));
  }
}