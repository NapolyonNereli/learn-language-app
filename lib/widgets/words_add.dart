import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/const_colors.dart';
import 'package:flutter_application_1/constant/const_text.dart';
import 'package:flutter_application_1/model/item_model.dart';
import 'package:flutter_application_1/model/words_model.dart';
import 'package:flutter_application_1/provider/word_provider.dart';
import 'package:provider/provider.dart';

class WordsAdd extends StatefulWidget {
  WordsAdd({Key? key, required this.item}) : super(key: key);
  Item item;

  @override
  State<WordsAdd> createState() => _WordsAddState();
}

class _WordsAddState extends State<WordsAdd> {
  var formKey = GlobalKey<FormState>();

  var backKey = GlobalKey<FormState>();

  TextEditingController frontWordAdd = TextEditingController();

  TextEditingController backWordAdd = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<WordProvider>(context, listen: false).initSP();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ConstColor.morrowWhite,
      title: ConstText.alertAddWord,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(
            color: ConstColor.creamyBerry,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: SizedBox(
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          autofocus: true,
                          cursorColor: ConstColor.purpleParadise,
                          controller: frontWordAdd,
                          decoration: const InputDecoration(
                              label: ConstText.labelFront,
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: ConstColor.amethystShow))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          autofocus: true,
                          cursorColor: ConstColor.purpleParadise,
                          controller: backWordAdd,
                          decoration: const InputDecoration(
                              label: ConstText.labelBack,
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: ConstColor.amethystShow))),
                        )
                      ],
                    ))),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: ElevatedButton(
                onPressed: () {
                  bool validResult = formKey.currentState!.validate();
                  if (validResult == true) {
                    Words words = Words(
                        title: frontWordAdd.text,
                        titleBack: backWordAdd.text,
                        category: widget.item.title);
                    Provider.of<WordProvider>(context, listen: false)
                        .addWords(words, words);
                    frontWordAdd.text = "";
                    Navigator.pop(context);
                  }
                },
                child: ConstText.addWordButton,
                style: ElevatedButton.styleFrom(
                    primary: ConstColor.purpleParadise)),
          ),
        ],
      ),
    );
  }
}

