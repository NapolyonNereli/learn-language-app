import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/const_colors.dart';
import 'package:flutter_application_1/constant/const_text.dart';
import 'package:flutter_application_1/model/item_model.dart';
import 'package:flutter_application_1/provider/card_provider.dart';
import 'package:provider/provider.dart';

class AddCategories extends StatefulWidget {
  AddCategories({Key? key}) : super(key: key);

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  TextEditingController categoriesText = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<CardProvider>(context, listen: false).initSharedPrefrences();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      backgroundColor: ConstColor.amethystShow,
      title: ConstText.alertAddCard,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(color: ConstColor.morrowWhite),
          TextFormField(
            validator: (value) => value == "" ? "Dont empty" : null,
            controller: categoriesText,
            cursorColor: ConstColor.morrowWhite,
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: ConstColor.purpleParadise),
                onPressed: () {
                  Item item = Item(title: categoriesText.text);
                  Provider.of<CardProvider>(context, listen: false)
                      .addCategory(item);

                  Navigator.pop(context);
                },
                child: ConstText.addCardButton,
              ))
        ],
      ),
    );
  }
}
