import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/models/post.dart';
import 'bloc/post_bloc.dart';
import 'state/post_loading_state.dart';
import 'state/post_state.dart';
import 'state/posts_loaded_state.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return loadingIndicator(state.message);
          } else if (state is PostLoadedState) {
            return listPosts(context, state.posts);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget listPosts(BuildContext context, List<Post> post) => ListView.builder(
      itemCount: post.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Country: ${post[index].userId}"),
                  Text("Total Confirmed: ${post[index].id}"),
                  Text("Total Deaths: ${post[index].title}"),
                  Text("Total Recovered: ${post[index].body}"),
                ],
              ),
            ),
          ),
        );
      });

  Widget emptyPosts() => const Center(child : Text('Empty Posts'));

  Widget loadingIndicator(String message) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        Text(message)
      ],
    ),
  );
}
