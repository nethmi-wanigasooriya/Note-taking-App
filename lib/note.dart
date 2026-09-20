class Note {
  final int? id;
  final String title;
  final String content;
  final String category; 

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'category': category,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      category: map['category'] ?? 'General',
    );
  }
}