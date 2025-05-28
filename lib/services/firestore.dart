import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // GET
  final CollectionReference players = FirebaseFirestore.instance.collection(
    'players',
  );

  // CREATE
  Future<void> addPlayer(
    String playerName,
    // String firstName,
    // String lastName
  ) {
    return players.add({
      // 'id': initId(players),
      'playerName': playerName,
      // 'firstName': firstName,
      // 'lastName': lastName,
      'createdAt': Timestamp.now(),
    });
  }

  // READ
  Stream<QuerySnapshot> getPlayersStream() {
    final playersStream = players.snapshots();
    return playersStream;
  }

  // UPDATE

  // DELETE
}
