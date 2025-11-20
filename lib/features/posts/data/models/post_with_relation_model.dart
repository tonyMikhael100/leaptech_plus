import 'package:leaptech_plus/features/posts/data/models/post_comment_model.dart';
import 'package:leaptech_plus/features/posts/data/models/post_model.dart';
import 'package:leaptech_plus/features/posts/data/models/post_user_model.dart';

class PostWithRelations {
  final PostModel post;
  final List<PostCommentModel> comments;
  final List<PostUserModel> likes;
  final List<String> images; // add images

  PostWithRelations({
    required this.post,
    required this.comments,
    required this.likes,
    required this.images,
  });
}
