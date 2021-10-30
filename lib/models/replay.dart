List<Replay> replaysFromJson(List data) => List<Replay>.from(
    data.map((e) => Replay.fromJson(e as Map<String, dynamic>)));

class Replay {
  final int id;
  final String body;

  Replay({required this.id, required this.body});
  factory Replay.fromJson(Map<String, dynamic> json) {
    return Replay(id: json['id'] as int, body: json['body'] as String);
  }
}
