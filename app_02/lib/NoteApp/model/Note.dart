class Note {
  int? id;
  String title;
  String content;
  int priority;
  DateTime createAt;
  DateTime modifiedAt;
  List<String> tags;
  String? color;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.priority,
    required this.createAt,
    required this.modifiedAt,
    required this.tags,
    this.color,

  });

  // Chuyển đối tượng thành Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'priority': priority,
      'createAt': createAt.toIso8601String(),
      'modifiedAt': modifiedAt.toIso8601String(),
      'tags': tags.join(','),
      'color': color,
    };
  }

  // Tạo đối tượng từ Map
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      priority: map['priority'],
      createAt: DateTime.parse(map['createAt']),
      modifiedAt: DateTime.parse(map['modifiedAt']),
      tags: map['tags'].split(','),
      color: map['color'],
    );
  }

  // Phương thức copy để tạo bản sao với một số thuộc tính được cập nhật
  Note copyWith({
    int? id,
    String? title,
    String? content,
    int? priority,
    DateTime? createAt,
    DateTime? modifiedAt,
    List<String>? tags,
    String? color,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      priority: priority ?? this.priority,
      createAt: createAt ?? this.createAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      tags: tags ?? this.tags,
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return 'Note(id: $id, title: $title, content: $content, priority: $priority, createAt: $createAt, modifiedAt: $modifiedAt, tags: $tags, color: $color)';
  }

}