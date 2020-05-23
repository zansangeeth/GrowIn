import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp5/main.dart';
import 'package:flutterapp5/signUp.dart';
import 'package:flutterapp5/signIn.dart';

class GetStart extends StatefulWidget {
  @override
  _GetStartState createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Center(
              child: Center(
                child: Padding(padding: EdgeInsets.only(right: 50.0,left: 50.0,bottom: 320),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 200.0,),
                      Text('Cultivate today', style: TextStyle(fontSize: 28,),),
                      Text('Harvest tomorrow', style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,),),
                    ],
                  ),
                ),
              ),
            ),


            Container(
              padding: EdgeInsets.only(top: 35,right: 15.0),
              child: Align(
                alignment: Alignment.topRight,
                child: new OutlineButton(
                    borderSide: BorderSide(color: Color(0xFF25CBA6)),
                    child: new Text("SIGN IN", style: TextStyle(color: Color(0xFF25CBA6),),),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn())),
                    },
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0),)
                )
              ),
            ),


            Container(
              child: Image(
                height: 740.0,
                fit: BoxFit.cover,
                image: AssetImage('images/getStart.png'),
              ),
            ),
            Positioned(
              bottom: 25.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                padding: EdgeInsets.all(0.0),
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp())),
                },
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
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}

