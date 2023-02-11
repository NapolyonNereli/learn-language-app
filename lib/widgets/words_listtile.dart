import 'package:flutter_application_1/constant/const_text.dart';
import 'package:flutter_application_1/model/words_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/word_provider.dart';
import 'package:flutter_application_1/widgets/card_back.dart';
import 'package:provider/provider.dart';

class WordsListtile extends StatelessWidget {
  WordsListtile({Key? key, required this.word}) : super(key: key);
  Words word;

  @override
  Widget build(BuildContext context) {
    return Consumer<WordProvider>(
      builder: (context, state, child) {
        return Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ListTile(
              title: Text(word.title),
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CardBack(
                      word: word,
                    );
                  }),
              onLongPress: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: ConstText.deleteItem,
                      content: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                state.removeWords(word);
                                Navigator.pop(context);
                              },
                              child: const Text("Yes")),
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel"))
                        ],
                      ),
                    );
                  })),
        );
      },
    );
  }
}


