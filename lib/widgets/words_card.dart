import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/const_colors.dart';
import 'package:flutter_application_1/constant/const_icons.dart';
import 'package:flutter_application_1/constant/const_text.dart';
import 'package:flutter_application_1/model/item_model.dart';
import 'package:flutter_application_1/model/words_model.dart';
import 'package:flutter_application_1/provider/card_provider.dart';
import 'package:flutter_application_1/provider/word_provider.dart';
import 'package:flutter_application_1/widgets/words_add.dart';
import 'package:flutter_application_1/widgets/words_list.dart';
import 'package:provider/provider.dart';

class WordsCard extends StatelessWidget {
  WordsCard({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      padding: const EdgeInsets.all(5),
      children: [
        Consumer<CardProvider>(
          builder: (context, state, child) {
            return SizedBox(
              width: 160,
              height: 160,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => WordList(item: item),
                  );
                },
                child: Card(
                  elevation: 2.0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  color: ConstColor.amethystShow,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          item.title,
                          style: const TextStyle(color: ConstColor.morrowWhite),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Consumer<WordProvider>(
                          builder: (context, state, child) {
                            return Text(
                              state.words
                                  .where(
                                    (element) =>
                                        element.category.contains(item.title),
                                  )
                                  .length
                                  .toString(),
                            );
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 30, top: 20),
                          child: ConstIcons.iconList)
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
