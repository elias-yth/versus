import 'package:cloud_firestore/cloud_firestore.dart';

class Match {
  final String id;
  final List<String> teamA;
  final List<String> teamB;
  final int scoreA;
  final int scoreB;
  final DateTime timestamp;

  Match({
    required this.id,
    required this.teamA,
    required this.teamB,
    required this.scoreA,
    required this.scoreB,
    required this.timestamp,
  });

  factory Match.fromMap(String id, Map<String, dynamic> data) {
    return Match(
      id: id,
      teamA: List<String>.from(data['teamA']),
      teamB: List<String>.from(data['teamB']),
      scoreA: data['scoreA'],
      scoreB: data['scoreB'],
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'teamA': teamA,
      'teamB': teamB,
      'scoreA': scoreA,
      'scoreB': scoreB,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }

  /// Returns the winning team
  List<String> get winningTeam => scoreA > scoreB ? teamA : teamB;

  /// Returns true if a given player was in the winning team
  bool didPlayerWin(String playerId) {
    return winningTeam.contains(playerId);
  }
}
