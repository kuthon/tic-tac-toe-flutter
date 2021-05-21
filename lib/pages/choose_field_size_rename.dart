import 'package:flutter/material.dart';
import 'package:tic_tac_toe/generated/l10n.dart';
import 'package:tic_tac_toe/pages/game_page.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';

class ChooseFieldSizePage extends StatelessWidget {

  final bool vsBot;

  ChooseFieldSizePage({required this.vsBot});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: Container(
            width: double.infinity,
            color: Theme.of(context).backgroundColor,
            padding: const EdgeInsets.all(5),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    S.of(context).field_size,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  CustomButton(
                      title: '3 x 3',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage(vsBot: vsBot, side: 3, isInfinity: false, winScore: 3,)));
                      }
                  ),
                  CustomButton(
                      title: '4 x 4',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage(vsBot: vsBot, side: 4, isInfinity: false, winScore: 4,)));
                      }
                  ),
                  CustomButton(
                      title: '5 x 5',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage(vsBot: vsBot, side: 5, isInfinity: false, winScore: 5,)));
                      }
                  ),
                  CustomButton(
                      title: '6 x 6',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage(vsBot: vsBot, side: 6, isInfinity: false, winScore: 6,)));
                      }
                  ),
                  CustomButton(
                      title: '7 x 7',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage(vsBot: vsBot, side: 7, isInfinity: false, winScore: 7,)));
                      }
                  ),
                ]
            )
        )
    ));
  }
}
