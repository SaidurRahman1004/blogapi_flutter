import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:blogapi_flutter/models/post.dart';
import 'package:blogapi_flutter/providers/service_providers.dart';

part 'post_provider.g.dart';

@riverpod
//fetch All posts
Future<List<Post>> fetchPosts(FetchPostsRef ref) async {
  final response = await ref.watch(apiServiceProvider).get('/posts/');
  final List<dynamic> results = response['results'];
  return results.map((json) => Post.fromJson(json)).toList();
}

//find single post
@riverpod
Future<Post> fetchPostById(FetchPostByIdRef ref, int id) async {
  final response = await ref.read(apiServiceProvider).get('/posts/$id/');
  return Post.fromJson(response);
}

//CURD Operation
@riverpod
class PostActions extends _$PostActions {
  @override
  void build() {
    //no state
  }

  //Create Post
  Future<void> createPost({
    required String title,
    required String content,
    int? category,
  }) async {
    final apiService = ref.read(apiServiceProvider);
    final data = {
      'title': title,
      'content': content,
      if (category != null) 'category': category,
    };
    await apiService.post('/posts/', data, requiresAuth: true);
    ref.invalidate(fetchPostsProvider);
  }
  //Update Post
  Future<void> updatePost({
    required int id,
    required String title,
    required String content,
  }) async {
    final apiService = ref.read(apiServiceProvider);
    final data = {
      'title': title,
      'content': content,
    };
    await apiService.put('/posts/$id/', data);
    ref.invalidate(fetchPostsProvider);
    ref.invalidate(fetchPostByIdProvider(id));

  }
  //Delete
  Future<void> deletePost(int id) async {
    await ref.read(apiServiceProvider).delete('/posts/$id/');
    ref.invalidate(fetchPostsProvider);

  }

}
