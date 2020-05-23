import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp5/main.dart';
import 'bottomButton.dart';
import 'package:flutterapp5/signUp.dart';

void main() =>runApp(GrowIn());

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

    //  final myController = TextEditingController();
    FocusNode myFocusNodeUserName = new FocusNode();
    FocusNode myFocusNodePassword = new FocusNode();


    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      myFocusNodeUserName.addListener((){ setState((){}); });
      myFocusNodePassword.addListener((){ setState((){}); });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 40,right: 120),
              child: BackButton(
                onPressed: ()=>{
                  Navigator.pop(context),
                },
                color: Colors.black,
              ),
            ),

            Expanded(child: Container(
              padding: EdgeInsets.only(
                  top: 10, right: 60
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Sign In',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 10.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'I don’t have an account', style: TextStyle(color: Colors.grey, fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(text: '  Create Account',
                              style: TextStyle(color: Color(0xFF25CBA6), fontSize: 15,),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                                }
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
            ),
            ),


              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(bottom:5,left: 20,right: 30,),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 350),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                        child: TextFormField(
                          focusNode:myFocusNodeUserName,
                          cursorColor: Color(0xFF25CBA6),
                          decoration: InputDecoration(
                            labelText: 'Email*',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                color: myFocusNodeUserName.hasFocus ? Color(0xFF25CBA6) : Colors.grey
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF25CBA6)),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        child: TextFormField(
                          focusNode:myFocusNodePassword,
                          cursorColor: Color(0xFF25CBA6),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                fontSize: 15,
                                color: myFocusNodePassword.hasFocus ? Color(0xFF25CBA6) : Colors.grey
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF25CBA6)),
                            ),
                            labelText: 'Password*',
                          ),
                          obscureText: true,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            Container(child: BottomButton(buttonTitle: 'Sign In',fontSize: 12),padding: EdgeInsets.only(bottom:20,left: 30,right: 30),),
          ],
        ),

      );
    }
  }




