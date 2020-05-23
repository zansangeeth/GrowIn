import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp5/main.dart';
import 'bottomButton.dart';
import 'package:flutterapp5/signIn.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() =>runApp(GrowIn());

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _mySelection;
  final String url = "https://api.growin.lk/";
  List<Map> countries;

  Future<String> getSWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      countries = resBody;
    });

    print(resBody);

    return "Sucess";
  }

//  final myController = TextEditingController();
  FocusNode myFocusNodeFirstName = new FocusNode();
  FocusNode myFocusNodeLastName = new FocusNode();
  FocusNode myFocusNodeEmail = new FocusNode();
  FocusNode myFocusNodeNIC = new FocusNode();
  FocusNode myFocusNodePassword = new FocusNode();
  FocusNode myFocusNodePhoneNumber = new FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNodeFirstName.addListener((){ setState((){}); });
    myFocusNodeLastName.addListener((){ setState((){}); });
    myFocusNodeEmail.addListener((){ setState((){}); });
    myFocusNodeNIC.addListener((){ setState((){}); });
    myFocusNodePassword.addListener((){ setState((){}); });
    myFocusNodePhoneNumber.addListener((){ setState((){}); });
    this.getSWData();
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
              top: 10, right: 120
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Create Account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 7.0,
                ),
                RichText(
                  text: TextSpan(
                    text: 'I don’t have an account', style: TextStyle(color: Colors.grey, fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(text: ' Sign In',
                            style: TextStyle(color: Color(0xFF25CBA6), fontSize: 15,),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
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
            padding: EdgeInsets.only(bottom: 20,left: 20,right: 30,),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListView(
                padding: EdgeInsets.only(bottom: 20),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      focusNode:myFocusNodeFirstName,
                      cursorColor: Color(0xFF25CBA6),
                      decoration: InputDecoration(
                        labelText: 'firstname*',
                        labelStyle: TextStyle(
                          fontSize: 15,
                            color: myFocusNodeFirstName.hasFocus ? Color(0xFF25CBA6) : Colors.grey
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
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      focusNode:myFocusNodeLastName,
                      cursorColor: Color(0xFF25CBA6),
                      decoration: InputDecoration(
                        labelText: 'last name*',
                        labelStyle: TextStyle(
                            fontSize: 15,
                            color: myFocusNodeLastName.hasFocus ? Color(0xFF25CBA6) : Colors.grey
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
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      focusNode: myFocusNodeEmail,
                      cursorColor: Color(0xFF25CBA6),
                      decoration: InputDecoration(
                        labelText: 'email*',
                        labelStyle: TextStyle(
                            fontSize: 15,
                            color: myFocusNodeEmail.hasFocus ? Color(0xFF25CBA6) : Colors.grey
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


                  new DropdownButton(
                    items:  countries?.map((Map value) {
                      return new DropdownMenuItem<Map>(
                        value: value,
                        child: new Text(value['countries'], style: new TextStyle(fontSize: 16.0),),
                      );
                    })?.toList() ?? [],
                    onChanged: (newVal) {
                      setState(() {
                        _mySelection = newVal;
                      });
                    },
                    value: _mySelection,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      focusNode: myFocusNodePhoneNumber,
                      cursorColor: Color(0xFF25CBA6),
                      decoration: InputDecoration(
                        labelText: 'Phone Number*',
                        labelStyle: TextStyle(
                            fontSize: 15,
                            color: myFocusNodePhoneNumber.hasFocus ? Color(0xFF25CBA6) : Colors.grey
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
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      focusNode:myFocusNodeNIC,
                      cursorColor: Color(0xFF25CBA6),
                      decoration: InputDecoration(
                        labelText: 'National Identy Card Number*',
                        labelStyle: TextStyle(
                            fontSize: 15,
                            color: myFocusNodeNIC.hasFocus ? Color(0xFF25CBA6) : Colors.grey
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
                    width: MediaQuery.of(context).size.width,
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
                        labelText: 'password*',
                      ),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(child: BottomButton(buttonTitle: 'Create Account',fontSize: 12,),padding: EdgeInsets.only(top: 70,left: 30,right: 30, bottom: 20),),
        ],

      ),

    );
  }
}
