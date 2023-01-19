import 'package:flutter/material.dart';


class AppColors {
  /// #Main Color
  static const Color mainWhiteColor = Color(0xFFFFFFFF);
  static const Color mainBackgroundColor = Color(0xFFF7F7F7);
  //static const Color mainColorGreen = Color(0xFF54CFA1);
  static const Color mainColorGreen = Color(0xFF107D42);
  static const Color mainColorBlack = Color(0xFF000000);

  /// #Sub Colors
  static const Color colorGrey = Color(0xFFF7F7F9);
  static const Color colorLightViolet = Color(0xFFEEE7F7);
  static const Color colorLightOrange = Color(0xFFFFEEC2);
  static const Color transparent = Colors.transparent;
  static const Color colorLightBlue = Color(0xFFBFE9FF);

  /// #TextColors
  static const Color colorTextDarkGrey = Color(0xFF4D4D4D);
  static const Color colorTextLightGrey = Color(0xFF717171);

  // #fonts
  static const String asossiyShrift = "Mulish";

  // #font_size
  static const double fontHeaderSize = 28;

  static const double jirniyStil=21;
  static const double kulrangMatnOlchami=16;
  static const double cardBoldSize=16;
  static const double cardHeadSize=16;
  static const double cardsimpleSize=12;




  // # MainTextStyle
  static const TextStyle mainTextSyle = TextStyle(color: Colors.black, fontFamily: asossiyShrift, fontSize: fontHeaderSize);

  static const TextStyle bukvalni=TextStyle(color:Colors.black, fontFamily: asossiyShrift, fontSize: jirniyStil, fontWeight: FontWeight.bold, height: 1.4 );

  static const TextStyle kulrangMatn=TextStyle(color: colorTextDarkGrey, fontFamily: asossiyShrift, fontSize: kulrangMatnOlchami, fontWeight: FontWeight.bold );

  static const TextStyle cardBoldStyle=TextStyle(color: Colors.black, fontFamily: asossiyShrift, fontSize: cardBoldSize, fontWeight: FontWeight.bold );
  static const TextStyle cardHeadStyle=TextStyle(color: Colors.black, fontFamily: asossiyShrift, fontSize: cardHeadSize, fontWeight: FontWeight.bold  );
  static const TextStyle cardSimpleStyle=TextStyle(color: Colors.black, fontFamily: asossiyShrift, fontSize: cardsimpleSize );


}
