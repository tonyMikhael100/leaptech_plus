import 'package:dartz/dartz.dart';
import 'package:leaptech_plus/core/errors/failure.dart';
import 'package:leaptech_plus/features/posts/data/models/post_model.dart';

abstract class PostsRepo {
  Future<Either<Failure, void>> addPost({required PostModel postModel});
  Future<Either<Failure, void>> deletePost({required int postId});
  Future<Either<Failure, List<PostModel>>> getAllPosts();
}
