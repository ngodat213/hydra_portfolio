class BlogPost {
  final String id;
  final String title;
  final String readTime;
  final String description;
  final String content;
  final String imagePath;
  final String type;
  final String author;
  final DateTime publishDate;
  final List<String> tags;

  BlogPost({
    required this.id,
    required this.title,
    required this.readTime,
    required this.description,
    required this.content,
    required this.imagePath,
    required this.type,
    required this.author,
    required this.publishDate,
    required this.tags,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      id: json['id'],
      title: json['title'],
      readTime: json['readTime'],
      description: json['description'],
      content: json['content'],
      imagePath: json['imagePath'],
      type: json['type'],
      author: json['author'],
      publishDate: DateTime.parse(json['publishDate']),
      tags: List<String>.from(json['tags']),
    );
  }
}
