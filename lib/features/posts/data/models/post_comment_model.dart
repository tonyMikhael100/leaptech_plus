import 'package:leaptech_plus/features/posts/data/models/post_user_model.dart';

class PostCommentModel {
  final String id;
  final String postId;
  final String userId;
  final String content;
  final DateTime createdAt;
  final PostUserModel user; // added user info

  PostCommentModel({
    required this.id,
    required this.postId,
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.user,
  });

  factory PostCommentModel.fromMap(Map<String, dynamic> map) {
    return PostCommentModel(
      id: map['id'] as String,
      postId: map['post_id'] as String,
      userId: map['user_id'] as String,
      content: map['content'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
      user: PostUserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }
}
