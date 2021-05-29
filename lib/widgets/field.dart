import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/generated/l10n.dart';
import 'package:tic_tac_toe/models/cage_state.dart';
import 'cage.dart';

class Field extends StatefulWidget {
  final int side;
  final bool vsBot;
  final bool isInfinity;
  final int winScore;
  Field(
      {this.side = 4,
        this.vsBot = true,
        this.isInfinity = false,
        this.winScore = 4});

  @override
  _FieldState createState() => _FieldState(
      side: side, vsBot: vsBot, isInfinity: isInfinity, winScore: winScore);
}

class _FieldState extends State<Field> {
  final int winScore;
  final bool isInfinity;
  int side;
  List _field = [[CageState.empty]];
  String _title = '';
  int _numberOfMoves = 0;
  final bool vsBot;
  bool _canDraw = true;
  bool _firstMoveEnemy = false;

  _FieldState({required this.side, required this.vsBot, required this.isInfinity, required this.winScore});

  @override
  void initState() {
    setState(() {
      if (isInfinity)
        side = 5;
      _field = List.generate(side, (_) => List.filled(side, CageState.empty));
      _numberOfMoves = 0;
      _canDraw = true;
      _firstMoveEnemy = false;
    });
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        _title = S.of(context).your_turn;
      });
    });
  }

  void _reinitialization({bool firstMoveEnemy = false, String title = ''}) {
    setState(() {
      if (isInfinity)
        side = 5;
      _field = List.generate(side, (_) => List.filled(side, CageState.empty));
      _numberOfMoves = 0;
      _canDraw = true;
      _firstMoveEnemy = firstMoveEnemy;
      _title = title;
      if (_firstMoveEnemy) {
        _title = S.of(context).opponents_turn;
        _botMove();
      }
      else {
        _title = S.of(context).your_turn;
      }

    });
  }

  void _increaseSide() {
    setState(() {
      _field = [
        [for (int i = 0; i < side + 2; i++) CageState.empty],
        for (int i = 0; i < side; i++)
          [CageState.empty, ..._field[i], CageState.empty],
        [for (int i = 0; i < side + 2; i++) CageState.empty]
      ];
      side += 2;
    });
  }

  bool _checkWin({required int coordinateX, required int coordinateY}) {
    bool checkLine(int x, int y, int dx, int dy) {
      int score = 1;
      bool search = true;
      while (search == true) {
        if (x - dx >= 0 && x - dx < side && y - dy >= 0 && y - dy < side) {
          if (_field[y][x] == _field[y - dy][x - dx] &&
              _field[y][x] != CageState.empty) {
            y -= dy;
            x -= dx;
          } else
            search = false;
        } else
          search = false;
      }
      search = true;
      while (search == true) {
        if (x + dx >= 0 && x + dx < side && y + dy >= 0 && y + dy < side) {
          if (_field[y][x] == _field[y + dy][x + dx] &&
              _field[y][x] != CageState.empty) {
            y += dy;
            x += dx;
            score += 1;
          } else
            search = false;
        } else
          search = false;
      }
      if (score >= winScore) return true;
      return false;
    }

    if (side * side <= _numberOfMoves) return true;

    bool res = false;
    res = res || checkLine(coordinateX, coordinateY, 0, 1);
    res = res || checkLine(coordinateX, coordinateY, 1, 0);
    res = res || checkLine(coordinateX, coordinateY, 1, 1);
    res = res || checkLine(coordinateX, coordinateY, 1, -1);
    return res;
  }


  void _draw(int i, int j) {
    if (_field[i][j] == CageState.empty && _canDraw) {
      setState(() {
        if (_numberOfMoves % 2 == 0) {
          _field[i][j] = CageState.cross;
          _firstMoveEnemy
              ? _title = S.of(context).your_turn
              : _title = S.of(context).opponents_turn;
        } else {
          _field[i][j] = CageState.circle;
          _firstMoveEnemy
              ? _title = S.of(context).opponents_turn
              : _title = S.of(context).your_turn;
        }
        _numberOfMoves += 1;
      });

      if (_checkWin(coordinateX: j, coordinateY: i) == true) {
        _gameOver();
      } else if (isInfinity && _numberOfMoves >= side * side ~/ 2.2) {
        _increaseSide();
      }
    }
  }

  void _gameOver(){
    setState(() {
      _canDraw = false;
      _title = S.of(context).game_over;
    });
    Timer(Duration(seconds: 1, milliseconds: 500), () {
      _reinitialization(
          firstMoveEnemy: !_firstMoveEnemy,
          title: _firstMoveEnemy
              ? S.of(context).your_turn
              : S.of(context).opponents_turn);
    });
  }

  void _botMove() {
    double coefficient = 0.0;
    int max = 0;
    List<double> cages = List.filled(side * side, 0.0);

    for (int i = 0; i < side; i++) {
      for (int j = 0; j < side; j++) {
        if (_field[i][j] == CageState.empty)
          coefficient = 0.01;
        else if (_firstMoveEnemy == true && _field[i][j] == CageState.cross ||
            _firstMoveEnemy == false && _field[i][j] == CageState.circle)
          coefficient = 1;
        else
          coefficient = 2;
        for (int k = 0; k < side; k++) {
          cages[k * side + j] += coefficient;
          cages[i * side + k] += coefficient;
          if (i == j) cages[k * side + k] += coefficient;
          if (i + j == side - 1)
            cages[side * (side - 1 - k) + k] += coefficient;
        }
      }
    }
    for (int i = 0; i < side; i++) {
      for (int j = 0; j < side; j++) {
        if (_field[i][j] != CageState.empty) cages[i * side + j] = 0;
      }
    }

    for (int k = 0; k < side * side; k++) {
      if (cages[max] <= cages[k]) max = k;
    }
    _draw(max ~/ side, max % side);
  }

  void _onPressed(int i, int j) {
    if (_field[i][j] == CageState.empty && _canDraw) {
      _draw(i, j);
      if (vsBot)
        _botMove();
    }

  }

  @override
  Widget build(BuildContext context) {

    return Column(children: <Widget>[
      Text(
        _title,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      SizedBox(height: 30),
      AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(1),
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Column(
            children: <Widget>[
              for (int i = 0; i < side; i++)
                Row(
                  children: <Widget>[
                    for (int j = 0; j < side; j++)
                      Cage(
                        cageState: _field[i][j],
                        coordinateY: i,
                        coordinateX: j,
                        onPressed: _onPressed,
                      ),
                  ],
                )
            ],
          ),
        ),
      ),
    ]);
  }
}
