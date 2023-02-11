import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/const_colors.dart';
import 'package:flutter_application_1/model/item_model.dart';
import 'package:flutter_application_1/model/words_model.dart';
import 'package:flutter_application_1/provider/card_provider.dart';
import 'package:flutter_application_1/provider/word_provider.dart';
import 'package:flutter_application_1/widgets/words_add.dart';
import 'package:flutter_application_1/widgets/words_listtile.dart';
import 'package:provider/provider.dart';

class WordList extends StatelessWidget {
  WordList({
    Key? key,
    required this.item,
  }) : super(key: key);
  Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstColor.purpleParadise,
        title:
            Text(item.title, style: TextStyle(color: ConstColor.morrowWhite)),
        centerTitle: true,
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Consumer<WordProvider>(
            builder: (context, state, child) {
              return ListView.builder(
                itemCount: state.allWords
                    .where((element) => element.category.contains(item.title))
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: WordsListtile(
                          word: state.allWords
                              .where((element) =>
                                  element.category.contains(item.title))
                              .toList()[index]));
                },
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: ConstColor.purpleParadise,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => WordsAdd(
                item: item,
              ),
            );
          },
          child: Icon(Icons.add, color: ConstColor.morrowWhite)),
    );
  }
}
