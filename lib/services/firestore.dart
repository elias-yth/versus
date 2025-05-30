import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // GET
  final CollectionReference players = FirebaseFirestore.instance.collection(
    'players',
  );

  // CREATE
  Future<void> addPlayer(String playerName) async {
    final id = await _initId();
    await players.add({
      'id': id,
      'playerName': playerName,
      'createdAt': Timestamp.now(),
    });
  }

  // READ
  Stream<QuerySnapshot> getPlayersStream() {
    final playersStream = players.snapshots();
    return playersStream;
  }

  final Random _random = Random();

  // PRIVATE: Generate unique 6-char ID
  Future<String> _initId() async {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    String getRandomId() =>
        List.generate(
          6,
          (index) => chars[_random.nextInt(chars.length)],
        ).join();

    while (true) {
      final candidate = getRandomId();

      final existing =
          await players.where('id', isEqualTo: candidate).limit(1).get();

      if (existing.docs.isEmpty) {
        return candidate;
      }
    }
  }

  // UPDATE

  // DELETE
}
