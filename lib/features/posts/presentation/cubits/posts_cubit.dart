import 'package:bloc/bloc.dart';
import 'package:leaptech_plus/features/posts/data/models/post_with_relation_model.dart';
import 'package:leaptech_plus/features/posts/data/repo/posts_repo_impl.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this._postsRepo) : super(PostsInitial());

  final PostsRepoImpl _postsRepo;

  Future<void> getAllPosts() async {
    emit(PostsGetAllPostsLoading());
    var response = await _postsRepo.getAllPosts();
    response.fold(
      (failure) => emit(PostsGetAllPostsFailure(failure.errorMessage)),
      (posts) => emit(PostsGetAllPostsSuccess(posts)),
    );
  }
}
