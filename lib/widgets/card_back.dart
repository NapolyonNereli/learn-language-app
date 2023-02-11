import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/const_colors.dart';
import 'package:flutter_application_1/model/words_model.dart';
import 'package:flutter_application_1/provider/word_provider.dart';
import 'package:provider/provider.dart';

class CardBack extends StatelessWidget {
  CardBack({Key? key, required this.word}) : super(key: key);
  Words word;
  @override
  Widget build(BuildContext context) {
    return Consumer<WordProvider>(
      builder: (context, state, child) {
        return AlertDialog(
          title: Text("Meaning = ${word.titleBack}"),
          backgroundColor: ConstColor.creamyBerry,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.thumb_up, color: Colors.green)),
              IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {},
                  icon: Icon(Icons.thumb_down, color: Colors.red)),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }
}
