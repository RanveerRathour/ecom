import "package:flutter/material.dart";

class CustomTheme{
  static const Color grey= Color(0xffDFDFDF);
  static const Color yellow =Color(0xffFFDB47);
  static const cardShadow=[BoxShadow(color: Colors.grey, blurRadius: 3,spreadRadius: 1, offset: Offset(0,2))];
  static const buttonShadow=[BoxShadow(color: Colors.grey, blurRadius: 3,spreadRadius: 1, offset: Offset(0,2))];
  static getCardDecoration(){
    return BoxDecoration(
      color: const Color.fromRGBO(240, 247, 242, 1.000),
      borderRadius: BorderRadius.circular(30),
      boxShadow: cardShadow,
    );
  }

  static  ThemeData getTheme(){4
    Map<String, double> fontSize={
      "sm":14,
      "md":18,
      "lg":24,
    };
    return ThemeData(
      primaryColor: yellow,
        fontFamily:'DMSans',

        appBarTheme: const AppBarTheme(
            backgroundColor:Colors.white, foregroundColor: Colors.black, toolbarHeight:70, centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'DMSans',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 4
            )
        ),
       tabBarTheme: const TabBarTheme(labelColor: yellow, unselectedLabelColor: Colors.black),
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: Colors.black, fontSize: fontSize['lg'], fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(color: Colors.black, fontSize: fontSize['md'], fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(color: Colors.black, fontSize: fontSize['sm'], fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontSize: fontSize['sm'], fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontSize: fontSize['sm'], fontWeight: FontWeight.bold, letterSpacing: 1),
        )

    );
  }
}