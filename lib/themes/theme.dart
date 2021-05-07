import 'package:flutter/material.dart';

ThemeData kTheme =  ThemeData(
    primaryColor: Color.fromRGBO(247, 132, 19, 1),
    secondaryHeaderColor: Color.fromRGBO(0, 109, 192, 1),
    backgroundColor: Color.fromRGBO(255, 216, 171, 1),
    textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Color.fromRGBO(128, 128, 128, 1),
          fontFamily: 'CantoraOne',
          fontSize: 26,
        ),
        headline6: TextStyle(
            color: Color.fromRGBO(247, 66, 16, 1),
            fontFamily: 'CantoraOne',
            fontSize: 38
        ),
        bodyText2: TextStyle(
          color: Color.fromRGBO(217, 27, 37, 1),
          fontSize: 24,
          fontFamily: 'CantoraOne',
        ),
        headline1: TextStyle(
            color: Color.fromRGBO(252, 251, 251, 1),
            fontFamily: 'CantoraOne',
            fontSize: 24
        )
    )
);