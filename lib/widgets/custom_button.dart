import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String title;
  final Function onPressed;

  CustomButton({@required this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      constraints: BoxConstraints(
          minWidth: 200,
          maxWidth: double.infinity,
          minHeight: 70,
          maxHeight: 100,
      ),
      margin: const EdgeInsets.only(right: 30, left: 30, top: 30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10,
            offset: Offset(-4, -4),
          ),
        ],
        color: Theme.of(context).primaryColor,
      ),
      child: GestureDetector(
        onTapDown: (_) => onPressed(),
        child: Center(
          child: Container(
            width: double.infinity,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
