class Post {
  final int id;
  final String title;
  final String slug;
  final String? excerpt;
  final String? content;
  final int author;
  final String authorUsername;
  final int? category;
  final String? categoryName;
  final String status;
  final String? image;
  final int viewCount;
  final int commentCount;
  final DateTime createdAt;

  Post({
    required this.id,
    required this.title,
    required this.slug,
    this.excerpt,
    this.content,
    required this.author,
    required this.authorUsername,
    this.category,
    this.categoryName,
    required this.status,
    this.image,
    this.viewCount = 0,
    this.commentCount = 0,
    required this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      excerpt: json['excerpt'],
      content: json['content'],
      author: json['author'],
      authorUsername: json['author_username'] ?? '',
      category: json['category'],
      categoryName: json['category_name'],
      status: json['status'],
      image: json['image'],
      viewCount: json['view_count'] ?? 0,
      commentCount: json['comment_count'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
