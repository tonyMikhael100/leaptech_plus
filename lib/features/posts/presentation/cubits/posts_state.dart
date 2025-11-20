part of 'posts_cubit.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

final class PostsGetAllPostsLoading extends PostsState {}

final class PostsGetAllPostsSuccess extends PostsState {
  final List<PostWithRelations> posts;

  PostsGetAllPostsSuccess(this.posts);
}

final class PostsGetAllPostsFailure extends PostsState {
  final String errorMessage;

  PostsGetAllPostsFailure(this.errorMessage);
}
