import 'package:flutter/material.dart';
import 'package:formation_juin_23/posts_api/posts/data/repositories/post_repository.dart';

import '../../data/models/post_model.dart';

class PostsScreen extends StatefulWidget {
  final String title;
  const PostsScreen({
    super.key,
    required this.title,
  });

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late PostRepository _postRepository;

  @override
  void initState() {
    _postRepository = PostRepository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: _postRepository.getAllPosts(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.none:
              return const Center(child: Text("Une erreur s'est produite"));

            case ConnectionState.done:
              var data = snapshot.data;

              if (data == null) {
                return const Center(child: Text("Une erreur s'est produite"));
              }

              return ListView.separated(
                itemBuilder: (context, index) {
                  var post = data[index];
                  return ListTile(
                    title: Text(post.title),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: data.length,
              );
          }
        },
      ),
    );
  }
}
