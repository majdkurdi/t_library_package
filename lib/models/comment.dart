import 'dart:convert';

import 'replay.dart';

List<Comment> commentsFromJson(String data) =>
    List<Comment>.from((jsonDecode(data)['comments'] as List)
        .map((e) => Comment.fromJson(e as Map<String, dynamic>)));

class Comment {
  final int id;
  final String body;
  List<Replay> replies;

  Comment({required this.id, required this.body, required this.replies});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        id: json['id'] as int,
        body: json['body'] as String,
        replies: replaysFromJson(json['replaies'] as List<dynamic>));
  }
}
