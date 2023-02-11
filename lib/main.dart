import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/const_colors.dart';
import 'package:flutter_application_1/provider/card_provider.dart';
import 'package:flutter_application_1/provider/word_provider.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CardProvider>(
            create: (context) => CardProvider()),
        ChangeNotifierProvider<WordProvider>(
            create: (context) => WordProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CardProvider card = Provider.of<CardProvider>(context, listen: false);
    return MaterialApp(
      title: "English",
      theme: ThemeData(scaffoldBackgroundColor: ConstColor.morrowWhite),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
