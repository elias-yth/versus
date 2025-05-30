import 'package:flutter/material.dart';
import 'package:versus/services/firestore.dart';
import 'package:versus/styles/typography.dart';
import 'package:versus/widgets/big_button_widget.dart';

void addPlayerDialog(
  BuildContext context,
  FirestoreService firestoreService,
  TextEditingController textController,
) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          content: TextField(
            controller: textController,
            style: TextStyle(fontFamily: 'Roboto'),
          ),
          actions: [
            BigButton(
              onPressed: () {
                firestoreService.addPlayer(textController.text);
                textController.clear();
                Navigator.pop(context);
              },
              child: H3('add player'),
            ),
          ],
        ),
  );
}
