import 'package:dio/dio.dart';
import 'package:formation_juin_23/posts_api/posts/data/models/post_model.dart';

class PostRepository {
  final Dio dio = Dio();

  Future<List<PostModel>> getAllPosts() async {
    Response response = await dio.get(
      "https://jsonplaceholder.typicode.com/posts",
    );

    var data = response.data;

    List<PostModel> posts = [];

    for (var item in data) {
      PostModel post = PostModel.fromJson(item);

      posts.add(post);
    }

    return posts;
  }
}
