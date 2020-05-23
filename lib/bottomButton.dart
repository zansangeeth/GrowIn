import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.buttonTitle,@required this.fontSize,@required VoidCallback onPressed});

  String buttonTitle;
  double fontSize;


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        padding: EdgeInsets.all(0.0),
        onPressed: () =>{},
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF25CBA6),
                  Color(0xFF44EC96),
                ]
            ),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 100.0,right: 100.0),
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
                color: Colors.white
            ),
          ),
        ),
      );
  }
}
