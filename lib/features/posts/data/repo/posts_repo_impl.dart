import 'package:dartz/dartz.dart';
import 'package:leaptech_plus/core/errors/failure.dart';
import 'package:leaptech_plus/features/posts/data/models/post_model.dart';
import 'package:leaptech_plus/features/posts/data/repo/posts_repo.dart';

class PostsRepoImpl implements PostsRepo {
  @override
  Future<Either<Failure, void>> addPost({required PostModel postModel}) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deletePost({required int postId}) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<PostModel>>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }
}
