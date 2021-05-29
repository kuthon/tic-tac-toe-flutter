import 'package:flutter/material.dart';
import 'package:tic_tac_toe/generated/l10n.dart';
import 'package:tic_tac_toe/pages/start_page.dart';
import 'package:tic_tac_toe/widgets/field.dart';

class GamePage extends StatelessWidget {
  final int side;
  final bool vsBot;
  final int winScore;
  final bool isInfinity;
  GamePage({required this.vsBot, required this.side, required this.isInfinity, required this.winScore});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Center(
              child: Text(
                isInfinity ? '${S.of(context).without_borders} ' : '${S.of(context).size}: $side x $side ',
                style: Theme.of(context).textTheme.headline1,
              ),
          )
        ],
        leading: Container(
          padding: const EdgeInsets.all(7),
          child: RawMaterialButton(
            child: Image.asset('assets/images/options.png'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => (StartPage())));
            },
            shape: CircleBorder(),
          )
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Theme.of(context).backgroundColor,
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Field(
              side: side,
              vsBot: vsBot,
              isInfinity: isInfinity,
              winScore: winScore,
            ),
          ],
        ),
      ),
    ));
  }
}
