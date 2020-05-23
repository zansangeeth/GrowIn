import 'package:flutter/material.dart';
import 'package:flutterapp5/getStart.dart';
import 'package:google_fonts/google_fonts.dart';

void main() =>runApp(GrowIn());

class GrowIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      initialRoute: '/',

      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: GetStart(),
    );
  }
}
