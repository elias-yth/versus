import 'package:flutter/material.dart';
import 'package:versus/styles/colors.dart';
import 'package:versus/styles/typography.dart';
import 'package:versus/widgets/big_button_widget.dart';
import 'package:versus/widgets/player_icon_widget.dart';
import 'package:versus/services/firestore.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController textEditingController = TextEditingController();

  void addPlayerDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: TextField(
              controller: textEditingController,
              style: TextStyle(fontFamily: 'Roboto'),
            ),
            actions: [
              BigButton(
                onPressed: () {
                  firestoreService.addPlayer(textEditingController.text);
                  textEditingController.clear();
                  Navigator.pop(context);
                  // setState(() {
                  //   playerPool.add(textEditingController.text);
                  // });

                  // checks for empty user input
                  // textEditingController.text.trim().isEmpty
                  //     ? print('empty string')
                  //     : () {
                  //       firestoreService.addPlayer(textEditingController.text);
                  //       textEditingController.clear();
                  //       Navigator.pop(context);
                  //     };
                },
                child: H3('add player'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: H2('TESTPAGE'),
      ),
      backgroundColor: AppColors.background,
      body: Center(
        child: TextButton(onPressed: addPlayerDialog, child: H3('ADD BUTTON')),
      ),
    );
  }
}
