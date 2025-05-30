import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Player {
  final String id;
  final String playerName;
  final Timestamp createdAt;

  Player({required this.id, required this.playerName, required this.createdAt});

  /// Parses Firestore map into Player object
  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map['id'] ?? '',
      playerName: map['playerName'] ?? '',
      createdAt: map['createdAt'] ?? Timestamp.now(),
    );
  }

  /// Converts Player object to Firestore-friendly map
  Map<String, dynamic> toMap() {
    return {'id': id, 'playerName': playerName, 'createdAt': createdAt};
  }

  /// Optional: toString for easy debugging
  @override
  String toString() {
    return 'Player(id: $id, playerName: $playerName, createdAt: $createdAt)';
  }
}

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

  // READ ONCE
  Future<List<Player>> getPlayersOnce() async {
    final snapshot = await players.get();

    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Player(
        id: data['id'] ?? doc.id,
        playerName: data['playerName'] ?? '',
        createdAt: data['createdAt'] ?? Timestamp.now(),
      );
    }).toList();
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
