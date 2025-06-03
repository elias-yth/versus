import 'package:flutter/material.dart';
import 'package:versus/services/firestore.dart';
import 'package:versus/styles/typography.dart';
import 'package:versus/widgets/big_button_widget.dart';
import 'package:uuid/uuid.dart';
import 'package:versus/models/player.dart';

Future<Player?> addPlayerDialog(
  BuildContext context,
  FirestoreService firestoreService,
  TextEditingController textController,
) async {
  final nameController = textController;
  return showDialog<Player>(
    context: context,
    builder:
        (context) => AlertDialog(
          content: TextField(
            controller: nameController,
            style: const TextStyle(fontFamily: 'Roboto'),
            decoration: const InputDecoration(hintText: 'Enter player name'),
          ),
          actions: [
            BigButton(
              onPressed: () async {
                final name = nameController.text.trim();
                if (name.isNotEmpty) {
                  final newPlayer = Player(
                    id: const Uuid().v4(),
                    name: name,
                    createdAt: DateTime.now(),
                  );

                  await firestoreService.createPlayer(newPlayer);
                  nameController.clear();
                  Navigator.pop(context, newPlayer); // <- return player
                }
              },
              child: H4('add player'),
            ),
          ],
        ),
  );
}

Future<Player?> editPlayer(
  BuildContext context,
  FirestoreService firestoreService,
  TextEditingController textController,
) async {
  final nameController = textController;
  return showDialog<Player>(
    context: context,
    builder:
        (context) => AlertDialog(
          content: TextField(
            controller: nameController,
            style: const TextStyle(fontFamily: 'Roboto'),
            decoration: const InputDecoration(hintText: 'Enter player name'),
          ),
          actions: [
            BigButton(
              onPressed: () async {
                final name = nameController.text.trim();
                if (name.isNotEmpty) {
                  final newPlayer = Player(
                    id: const Uuid().v4(),
                    name: name,
                    createdAt: DateTime.now(),
                  );

                  await firestoreService.createPlayer(newPlayer);
                  nameController.clear();
                  Navigator.pop(context, newPlayer); // <- return player
                }
              },
              child: H4('add player'),
            ),
          ],
        ),
  );
}
