import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:versus/models/player.dart';
import 'package:versus/models/match.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ========== MATCHES ==========

  Future<void> createMatch(Match match) async {
    await _db.collection('matches').doc(match.id).set(match.toMap());
  }

  Future<Match> getMatch(String matchId) async {
    final doc = await _db.collection('matches').doc(matchId).get();
    if (!doc.exists) throw Exception('Match not found: $matchId');
    return Match.fromMap(doc.id, doc.data()!);
  }

  Stream<List<Match>> getMatchesStream() {
    return _db
        .collection('matches')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => Match.fromMap(doc.id, doc.data()))
                  .toList(),
        );
  }

  Future<void> updateMatch(Match match) async {
    await _db.collection('matches').doc(match.id).update(match.toMap());
  }

  Future<void> deleteMatch(String matchId) async {
    await _db.collection('matches').doc(matchId).delete();
  }

  // ========== PLAYERS ==========

  Future<void> createPlayer(Player player) async {
    await _db.collection('players').doc(player.id).set(player.toMap());
  }

  Future<Player> getPlayer(String playerId) async {
    final doc = await _db.collection('players').doc(playerId).get();
    if (!doc.exists) throw Exception('Player not found: $playerId');
    return Player.fromMap(doc.id, doc.data()!);
  }

  Stream<List<Player>> getPlayersStream() {
    return _db
        .collection('players')
        .orderBy('name')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => Player.fromMap(doc.id, doc.data()))
                  .toList(),
        );
  }

  Future<void> updatePlayer(Player player) async {
    await _db.collection('players').doc(player.id).update(player.toMap());
  }

  Future<void> deletePlayer(String playerId) async {
    await _db.collection('players').doc(playerId).delete();
  }
}
