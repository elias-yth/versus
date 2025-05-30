import 'package:flutter/material.dart';
import 'package:versus/services/firestore.dart';
import 'package:versus/styles/typography.dart';
import 'package:versus/widgets/big_button_widget.dart';
import 'package:uuid/uuid.dart';
import 'package:versus/models/player.dart';

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
            style: const TextStyle(fontFamily: 'Roboto'),
            decoration: const InputDecoration(hintText: 'Enter player name'),
          ),
          actions: [
            BigButton(
              onPressed: () async {
                final name = textController.text.trim();
                if (name.isNotEmpty) {
                  final newPlayer = Player(
                    id: const Uuid().v4(),
                    name: name,
                    createdAt: DateTime.now(),
                  );

                  print('Creating player with ID: ${newPlayer.id}');

                  await firestoreService.createPlayer(newPlayer);
                  textController.clear();
                  Navigator.pop(context);
                }
              },
              child: H4('add player'),
            ),
          ],
        ),
  );
}
