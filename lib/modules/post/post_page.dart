import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/post_bloc.dart';
import 'event/fetch_post_event.dart';
import 'post_view.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    PostBloc postBloc = PostBloc();
    postBloc.add(FetchPostEvent());
    return MaterialApp(
      home: BlocProvider(
        create: (_) => postBloc,
        child: const PostView(),
      ),
    );
  }
}