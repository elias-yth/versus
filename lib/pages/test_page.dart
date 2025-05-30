import 'package:flutter/material.dart';
import 'package:versus/styles/colors.dart';
import 'package:versus/styles/typography.dart';
import 'package:versus/widgets/big_button_widget.dart';
import 'package:versus/widgets/custom_card_widget.dart';
import 'package:versus/widgets/dialogs/dialogs.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: H2('TESTPAGE'),
      ),
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCard(
                height: 200,
                width: 500,
                child: Row(
                  children: [
                    PlayerIcon(display: 'Elias', onPressed: () {}),
                    PlayerIcon(display: 'Leo', onPressed: () {}),
                  ],
                ),
              ),
              CustomCard(height: 400, width: 500),
              TextButton(
                onPressed:
                    () => addPlayerDialog(
                      context,
                      firestoreService,
                      textEditingController,
                    ),
                child: H3('ADD BUTTON'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
