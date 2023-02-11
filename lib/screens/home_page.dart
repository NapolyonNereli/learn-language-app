import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/const_colors.dart';
import 'package:flutter_application_1/constant/const_icons.dart';
import 'package:flutter_application_1/constant/const_text.dart';
import 'package:flutter_application_1/provider/card_provider.dart';
import 'package:flutter_application_1/widgets/add_categories.dart';
import 'package:flutter_application_1/widgets/words_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColor.purpleParadise,
        elevation: 0,
        centerTitle: true,
        title: ConstText.appbarTitle,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Consumer<CardProvider>(
          builder: (context, state, child) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return GridTile(
                  child: WordsCard(item: state.categories[index]),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddCategories();
              });
        },
        child: ConstIcons.iconAdd,
        backgroundColor: ConstColor.purpleParadise,
      ),
    );
  }
}
