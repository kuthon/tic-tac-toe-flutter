import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tic_tac_toe/generated/l10n.dart';
import 'package:tic_tac_toe/pages/choose_field_size_rename.dart';
import 'package:tic_tac_toe/pages/game_page.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool isSwitched = false;
  bool vsBot = true;
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
              S.of(context).tic_tac_toe,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 40,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(
                S.of(context).for_two,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Switch(
                  value: isSwitched,
                  activeTrackColor: Colors.green,
                  activeColor: Colors.white,
                  onChanged: (_) {
                    setState(() {
                      vsBot = !vsBot;
                      isSwitched = !isSwitched;
                    });
                  }),
            ]),

            CustomButton(
                title: S.of(context).by_size,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseFieldSizePage(vsBot: vsBot,)));
                }),
            CustomButton(
                title: S.of(context).without_borders,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage(vsBot: vsBot, side: 5, isInfinity: true, winScore: 4,)));
                }),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ));
  }
}
