import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/widgets/app_card.dart';
import 'package:leaptech_plus/features/posts/presentation/cubits/posts_cubit.dart';
import 'package:leaptech_plus/features/posts/presentation/widgets/post_item.dart';

class PostsScreenBody extends StatefulWidget {
  const PostsScreenBody({
    super.key,
  });

  @override
  State<PostsScreenBody> createState() => _PostsScreenBodyState();
}

class _PostsScreenBodyState extends State<PostsScreenBody> {
  @override
  void initState() {
    context.read<PostsCubit>().getAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCard(
          child: Text(
            'What\'s new',
            style: AppTextStyles.font16WhiteBold,
          ),
        ),
        BlocConsumer<PostsCubit, PostsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is PostsGetAllPostsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PostsGetAllPostsSuccess) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    return PostItem(postWithRelation:state.posts[index]);
                  },
                ),
              );
            }
            if (state is PostsGetAllPostsFailure) {
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(
                      onPressed: () {
                        context.read<PostsCubit>().getAllPosts();
                      },
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
