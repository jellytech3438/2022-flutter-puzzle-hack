import 'dart:async';
import 'dart:core';
import 'dart:math';

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
  GameBloc(this.level,this.puzzleStatus,this.levelStars) : super(const GameState()) {
    // event is input
    // state is output
    // on<input>(function that emit new state or just do something)
    on<ChooseLevel>(_onChooseLevel);
    on<StartLevel>(_onStartLevel);
    on<GameInitialized>(_onGameInitialized);
  }

  // Parameters

  int level;

  List<PuzzleStatus> puzzleStatus;

  List<int> levelStars;

  // Event Handler

  Puzzle _generatePuzzle(){
    Puzzle puzzle = Puzzle(tiles: []);
    puzzle.initializeTiles(level);
    return puzzle;
  }

  void _onGameInitialized(GameInitialized event, Emitter<GameState> emit,) {
    final puzzle = _generatePuzzle();
    emit(
      GameState(
        puzzle: puzzle,
      ),
    );
  }

  void _onChooseLevel(ChooseLevel event, Emitter<GameState> emit,) {
    emit(ChooseLevelState());
  }

  void _onStartLevel(StartLevel event, Emitter<GameState> emit,) {
    this.level = event.chooseLevel;
    event.puzzleBloc.add(PuzzleInitialized(this.level));
  }
}