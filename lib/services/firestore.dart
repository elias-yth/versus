import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // GET
  final CollectionReference players = FirebaseFirestore.instance.collection(
    'players',
  );

  // CREATE
  Future<void> addPlayer(String nickname, String firstName, String lastName) {
    return players.add({
      // 'id': initId(players),
      'playerName': nickname,
      'firstName': firstName,
      'lastName': lastName,
      'createdAt': Timestamp.now(),
    });
  }

  // READ

  // UPDATE

  // DELETE
}
