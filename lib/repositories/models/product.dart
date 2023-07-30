class Post {
  int userId, id;
      String title, body;
  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userId: json['userId'],
    id: json['id'],
    title: json['title'],
    body: json['body'],
  );

  Post copyWith({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) {
    return Post(
      userId: userId,
      id: id,
      title: title,
      body: body,
    );
  }
}
