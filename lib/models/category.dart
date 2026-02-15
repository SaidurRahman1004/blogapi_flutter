class Category {
  final int id;
  final String name;
  final String slug;
  final String? description;
  final int postCount;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
     this.postCount = 0,
  });
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      postCount: json['post_count'] ?? 0,
    );
  }
}
