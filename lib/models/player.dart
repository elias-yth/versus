import 'package:cloud_firestore/cloud_firestore.dart';

class Player {
  final String id;
  final String name;
  final DateTime createdAt;

  Player({required this.id, required this.name, required this.createdAt});

  factory Player.fromMap(String id, Map<String, dynamic> data) {
    return Player(
      id: id,
      name: data['name'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'createdAt': Timestamp.fromDate(createdAt)};
  }
}
