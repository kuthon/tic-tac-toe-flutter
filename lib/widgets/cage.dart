import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/cage_state.dart';

class Cage extends StatelessWidget {
  CageState cageState;
  final int coordinateX;
  final int coordinateY;
  final Function onPressed;

  Cage(
      {@required this.cageState,
        @required this.coordinateX,
        @required this.coordinateY,
        @required this.onPressed});

  _cageFilling(CageState cageState) {
    if (cageState == CageState.circle)
      return Image.asset('assets/images/circle.png', fit: BoxFit.contain);
    else if (cageState == CageState.cross)
      return Image.asset('assets/images/cross.png', fit: BoxFit.contain);
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(1),
          color: Color.fromRGBO(255, 222, 198, 1),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              onPressed(coordinateY, coordinateX);
            },
            child: Container(child: _cageFilling(cageState), padding: const EdgeInsets.all(10),),
          ),
        ),
      ),
    );
  }
}
